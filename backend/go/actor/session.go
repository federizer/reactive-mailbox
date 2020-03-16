package actor

import (
	svMessage "github.com/federizer/reactive-mailbox/actor/message"
	"github.com/sirupsen/logrus"
)

// AdminChat - actor to represent chat between admin and user
type AdminChat struct {
	collection     *actor.PID
	endPointWriter *actor.PID
	interlocutor   map[string]string
	logger         *logrus.Entry
}

// Receive messages
func (state *AdminChat) Receive(context actor.Context) {
	state.beforeProcess(context)
	switch msg := context.Message().(type) {
	case *svMessage.AdminChatAdminMessage:
		state.processAdminMessage(msg)
	case *svMessage.SupportChatAdminMessage:
		state.resolveAdminMessage(msg)
	case *svMessage.AdminChatUserMessage:
		state.processUserMessage(msg)
	case *svMessage.SupportChatUserMessage:
		state.resolveUserMessage(msg)
	case *svMessage.AdminChatRemoteProcessUserMessage:
		state.processRemoteUserMessage(msg)
	case *svMessage.SupportChatRemoteProcessUserMessage:
		state.resolveRemoteUserMessage(msg)
	case *svMessage.ClientDisconnect:
		state.processClientDisconnect(msg)
	case *svMessage.AdminChatRemoteClientDisconnect:
		state.processRemoteClientDisconnect(msg)
	case actor.SystemMessage:
		// just ignore
	case actor.AutoReceiveMessage:
		// just ignore
	default:
		state.logger.Warn("Uncaught message")
	}
}

func (state *AdminChat) beforeProcess(context actor.Context) {
	state.logger = logrus.WithFields(logrus.Fields{
		"actor":   "AdminChat",
		"message": context.Message(),
	})
}

func (state *AdminChat) processAdminMessage(msg *svMessage.AdminChatAdminMessage) {
	message, err := msg.Stringify()
	if err != nil {
		return
	}
	adminName := msg.UserData.Username
	clientName, err := msg.Username()
	if err != nil {
		return
	}
	if clientName == "" {
		return
	}
	_, existDialog := state.interlocutor[clientName]
	if message == "#admin_chat_close" {
		if existDialog {
			state.endPointWriter.Tell(&svMessage.RemoveClientDisconnectListener{
				UserName:  clientName,
				ActorName: "admin-chat",
			})
			delete(state.interlocutor, clientName)
		}
	} else {
		if !existDialog {
			state.interlocutor[clientName] = adminName
			if clientName != "" && adminName != "" {
				state.collection.Tell(&svMessage.SupportChatCreateDialog{
					ClientName: clientName,
					AdminName:  adminName,
					Message:    message,
				})
			}
			state.subscribeOnDisconnection(msg)
		}
	}
	state.collection.Tell(msg)
}

func (state *AdminChat) resolveAdminMessage(msg *svMessage.SupportChatAdminMessage) {
	state.endPointWriter.Tell(&svMessage.BroadcastMessage{
		SendMessage: msg.SendMessage,
	})
	actor.NewLocalPID(msg.AdminName).Tell(&svMessage.BroadcastAdminMessage{
		SendMessage: msg.SendMessage,
	})
}

func (state *AdminChat) processUserMessage(msg *svMessage.AdminChatUserMessage) {
	message, err := msg.Stringify()
	if err != nil {
		return
	}
	clientName := msg.UserData.Username
	adminName, existDialog := state.interlocutor[clientName]
	actor.NewLocalPID(clientName).Tell(&svMessage.BroadcastMessage{
		SendMessage: svMessage.SendMessage{
			Username: clientName,
			Message:  msg.BuildClientSideResponse(message, clientName),
		},
	})
	if existDialog {
		msg.Message["admin_chat"] = adminName
		state.collection.Tell(msg)
	} else {
		state.endPointWriter.Tell(&svMessage.AdminChatRemoteProcessUserMessage{
			AdminName:  "",
			ClientName: clientName,
			Message:    message,
		})
	}
}

func (state *AdminChat) resolveUserMessage(msg *svMessage.SupportChatUserMessage) {
	message := msg.Message
	adminName := msg.AdminName
	clientName := msg.ClientName
	actor.NewLocalPID(adminName).Tell(&svMessage.BroadcastAdminMessage{
		SendMessage: svMessage.SendMessage{
			Username: adminName,
			Message:  msg.BuildClientSideResponse(message, clientName),
		},
	})
}

func (state *AdminChat) processRemoteUserMessage(msg *svMessage.AdminChatRemoteProcessUserMessage) {
	adminName, existDialog := state.interlocutor[msg.ClientName]
	if existDialog {
		msg.AdminName = adminName
		state.collection.Tell(msg)
	}
}

func (state *AdminChat) resolveRemoteUserMessage(msg *svMessage.SupportChatRemoteProcessUserMessage) {
	adminName := msg.AdminName
	clientName := msg.ClientName
	message := msg.Message
	actor.NewLocalPID(adminName).Tell(&svMessage.BroadcastAdminMessage{
		SendMessage: svMessage.SendMessage{
			Username: adminName,
			Message:  `{"type":"admin_chat","data":{"from":"` + clientName + `","message":"` + message + `","channel":"Admin"}}`,
		},
	})
}

func (state *AdminChat) subscribeOnDisconnection(msg *svMessage.AdminChatAdminMessage) {
	userName, err := msg.Username()
	if err != nil {
		return
	}
	adminName := msg.UserData.Username
	if adminName != "" && userName != "" {
		state.endPointWriter.Tell(&svMessage.AddClientDisconnectListener{
			UserName:  userName,
			ActorName: "admin-chat",
		})
	} else {
		state.logger.Warn("Empty channel for disconnection subscribe")
	}
}

func (state *AdminChat) processClientDisconnect(msg *svMessage.ClientDisconnect) {
	userName := msg.UserData.Username
	adminName, hasListener := state.interlocutor[userName]
	if hasListener {
		broadcastAdminMessage(adminName, userName)
	} else {
		state.endPointWriter.Tell(&svMessage.AdminChatRemoteClientDisconnect{
			UserData: msg.UserData,
		})
	}
}

func (state *AdminChat) processRemoteClientDisconnect(msg *svMessage.AdminChatRemoteClientDisconnect) {
	userName := msg.UserData.Username
	adminName, hasListener := state.interlocutor[userName]
	if hasListener {
		broadcastAdminMessage(adminName, userName)
	}
}

func broadcastAdminMessage(adminName, userName string) {
	actor.NewLocalPID("client-service").Tell(&svMessage.BroadcastAdminMessage{
		SendMessage: svMessage.SendMessage{
			Username: adminName,
			Message:  `{"type":"user_offline","data":{"username":"` + userName + `","channel":"` + adminName + `"}}`,
		},
	})
}

// AdminChatProducer creates AdminChat actor
func AdminChatProducer() actor.Actor {
	return &AdminChat{
		collection:     actor.NewLocalPID("support-chat"),
		endPointWriter: actor.NewLocalPID("end-point-writer"),
		interlocutor:   make(map[string]string),
	}
}
