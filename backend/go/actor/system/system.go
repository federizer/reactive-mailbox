package system

import (
	"github.com/federizer/reactive-mailbox/actor"
	"github.com/federizer/reactive-mailbox/actor/errors"
	"github.com/federizer/reactive-mailbox/actor/mailbox"
	"sync"
)

/////////////////////////////////////////////////////////////////////////////////
// Actor Outline in Go

// Actor -> struct
// + goroutine

// Mailbox -> chan

//func StartActor() *Actor {
//	ch := make(chan action, size)
//	actor := &Actor{...}
//	go actor actorLoop(ch)
//	return actor
//}

//func (actor *Actor) DoSomething() {
//	actor.actionChan <- something
//}

//func (actor *Actor) actorLoop(ch <-chan action) {
//	for {
//		action := ch
//		// deal with action
//	}
//}

// ConnectionMaker in Go

//type action func()
//
//func (cm ConnectionMaker) Add(address string) {
//	cm.actionChan <- func() {
//		cm.addConnection(address)
//	}
//}

// ConnectionMaker Loop

//func (cm *ConnectionMaker) actionLoop(ch <- action) {
//	timer := time.NewTimer(duration)
//	for {
//		select {
//		case action := <-ch:
//			action()
//		case <-timer.C:
//			retryConnections()
//		}
//	}
//}

// Actions with return values

//func (cm *ConnectionMaker) String() string {
//	resultChan := make(chan string, 0)
//	cm.actionChan <- func() {
//		resultChan <- cm.status
//	}
//	return <-resultChan
//}

// Non-blocking send

//func (actor *SomeActor) TryTo(something) {
//	select {
//	case actor.actionChan <- func() {
//		// do the thing
//	}:
//	default:
//		// chan is full; throw it away
//	}
//}

/////////////////////////////////////////////////////////////////////////////////

// system implements actor.System
type system struct {
	wg        sync.WaitGroup
	lock      sync.Mutex
	lastPid   actor.Pid
	mailboxes map[actor.Pid]mailbox.Mailbox
}

// New creates a new System
func New() actor.System {
	return &system{
		mailboxes: make(map[actor.Pid]mailbox.Mailbox),
	}
}

func actorLoop(actor actor.Actor, mailbox mailbox.Mailbox) {
	var err error
	for {
		prevState := actor
		message := mailbox.Dequeue()
		actor, err = prevState.Receive(message)

		if err == errors.Stash {
			mailbox.Stash(message)
		} else if actor != prevState {
			mailbox.Unstash()
		}

		if err != nil && err != errors.Stash {
			break
		}
	}
}

func (s *system) Spawn(constructor actor.Constructor) actor.Pid {
	mbox := mailbox.New()

	s.lock.Lock()
	s.lastPid++ // check for wraparound?
	pid := s.lastPid
	s.mailboxes[pid] = mbox
	s.lock.Unlock()

	s.wg.Add(1)

	// We have to create an actor synchronously. Otherwise it's
	// possible that someone will call Send before the Mailbox
	// will be fully initialized, i.e. including SetLimit.
	act, limit := constructor(s, pid)
	mbox.SetLimit(limit)

	go func() {
		actorLoop(act, mbox)

		s.lock.Lock()
		delete(s.mailboxes, pid)
		s.lock.Unlock()

		s.wg.Done()
	}()

	return pid
}

func (s *system) Send(pid actor.Pid, message actor.Message) error {
	s.lock.Lock()
	mbox, ok := s.mailboxes[pid]
	s.lock.Unlock()

	if !ok {
		return errors.InvalidPid
	}

	return mbox.Enqueue(message)
}

func (s *system) SendPriority(pid actor.Pid, message actor.Message) error {
	s.lock.Lock()
	mbox, ok := s.mailboxes[pid]
	s.lock.Unlock()

	if !ok {
		return errors.InvalidPid
	}

	return mbox.EnqueueFront(message)
}

func (s *system) AwaitTermination() {
	s.wg.Wait()
}
