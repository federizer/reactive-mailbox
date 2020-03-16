package message

import (
	svModel "github.com/federizer/reactive-mailbox/api/generated/auth"

	"errors"
	"fmt"
	"html"
)

type (
	AdminChatRemoteProcessUserMessage struct {
		AdminName, ClientName, Message string
	}
	AdminChatMessage struct {
		UserData svModel.UserData
		Message  map[string]interface{}
	}
	AdminChatAdminMessage struct {
		AdminChatMessage
	}
	AdminChatUserMessage struct {
		AdminChatMessage
	}
	AdminChatRemoteClientDisconnect struct {
		UserData svModel.UserData
	}
)

func (msg AdminChatRemoteProcessUserMessage) String() string {
	return fmt.Sprintf("%#v", msg)
}

func (msg AdminChatMessage) String() string {
	return fmt.Sprintf("%#v", msg)
}

func (msg AdminChatRemoteClientDisconnect) String() string {
	return fmt.Sprintf("%#v", msg)
}

func (msg *AdminChatAdminMessage) Stringify() (string, error) {
	message, isString := msg.Message["message"].(string)
	if isString {
		return html.EscapeString(message), nil
	} else {
		return "", errors.New("message invalid data type")
	}
}

func (msg *AdminChatUserMessage) Stringify() (string, error) {
	message, isString := msg.Message["message"].(string)
	if isString {
		return html.EscapeString(message), nil
	} else {
		return "", errors.New("message field invalid data type")
	}
}

func (msg *AdminChatAdminMessage) Username() (string, error) {
	channel, isString := msg.Message["channel"].(string)
	if isString {
		return html.EscapeString(channel), nil
	} else {
		return "", errors.New("channel field invalid data type")
	}
}

func (msg *AdminChatUserMessage) Channel() (string, error) {
	channel, isString := msg.Message["admin_chat"].(string)
	if isString {
		return html.EscapeString(channel), nil
	} else {
		return "", errors.New("admin_chat field invalid data type")
	}
}

func (msg *AdminChatAdminMessage) BuildClientSideResponse(message, channel string) string {
	return `{"type":"admin_chat","data":{"from":"Admin","message":"` + message + `","channel":"` + channel + `"}}`
}

func (msg *AdminChatUserMessage) BuildClientSideResponse(message, client string) string {
	return `{"type":"admin_chat","data":{"from":"` + client + `","message":"` + message + `","channel":"` + client + `"}}`
}
