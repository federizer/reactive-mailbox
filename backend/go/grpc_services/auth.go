package grpc_services

import (
	"context"
	"database/sql"
	"errors"
	"fmt"
	pbauth "github.com/federizer/reactive-mailbox/api/generated/auth"
	"github.com/google/uuid"
	"github.com/reactivex/rxgo/v2"
	log "github.com/sirupsen/logrus"
	"sync"
	"time"
)

/*var ch = make(chan rxgo.Item)
go producer(ch)
observable := rxgo.FromChannel(ch)*/

// Create the input channel
// var ch = make(chan rxgo.Item)
var obs rxgo.Observable
var ch chan rxgo.Item

type AuthStorage interface {
	Get() <-chan rxgo.Item
}

type AuthStorageImpl struct {
	DB *sql.DB
	// List of connected clients
	SignUpClients map[string]pbauth.AuthService_SignupServer
	SignInClients map[string]pbauth.AuthService_SigninServer
	Mu            sync.RWMutex
}

func init() {
	ch = make(chan rxgo.Item)
	// ch := make(chan rxgo.Item, 1)
	// rxgo doesn't support broadcast, only connectable WithPublishStrategy/Connect
	// obs = rxgo.FromChannel(ch, rxgo.WithPublishStrategy())
	obs = rxgo.FromChannel(ch)
	// Create an Observable
	/*obs = rxgo.Create([]rxgo.Producer{func(ctx context.Context, next chan<- rxgo.Item) {
		next <- rxgo.Of(1)
		next <- rxgo.Of(2)
		next <- rxgo.Of(3)
	}})*/
	/*producer := []rxgo.Producer{func(_ context.Context, ch chan<- rxgo.Item) {
		for i := 0; i < 3; i++ {
			ch <- rxgo.Of(i)
		}
	}}
	obs = rxgo.Defer(producer)*/
	// obs = rxgo.Empty()
}

func (s *AuthStorageImpl) addSignUpClient(uid string, srv pbauth.AuthService_SignupServer) {
	s.Mu.Lock()
	defer s.Mu.Unlock()
	s.SignUpClients[uid] = srv
}

func (s *AuthStorageImpl) removeSignUpClient(uid string) {
	s.Mu.Lock()
	defer s.Mu.Unlock()
	delete(s.SignUpClients, uid)
}

func (s *AuthStorageImpl) addSignInClient(uid string, srv pbauth.AuthService_SigninServer) {
	s.Mu.Lock()
	defer s.Mu.Unlock()
	s.SignInClients[uid] = srv
}

func (s *AuthStorageImpl) removeSignInClient(uid string) {
	s.Mu.Lock()
	defer s.Mu.Unlock()
	delete(s.SignInClients, uid)
}

func (s *AuthStorageImpl) Signup(in *pbauth.SignUpRequest, srv pbauth.AuthService_SignupServer) error {
	uid := uuid.Must(uuid.NewRandom()).String()
	log.Printf("new session: %s", uid)

	s.addSignUpClient(uid, srv)
	defer s.removeSignUpClient(uid)

	authSession := pbauth.AuthSession{}
	authSession.State = pbauth.AuthState_USER_SIGNED_UP
	authSession.AccessToken = "accessToken123"
	authSession.RefreshToken = "refreshToken123"

	if err := srv.Send(&authSession); err != nil {
		log.Printf("send err: %v", err)
		return err
	}

	for {
		select {
		case <-srv.Context().Done():
			return srv.Context().Err()
		}
	}
}

func (s *AuthStorageImpl) Signin(in *pbauth.SignInRequest, srv pbauth.AuthService_SigninServer) error {
	uid := uuid.Must(uuid.NewRandom()).String()
	log.Printf("new session: %s", uid)

	s.addSignInClient(uid, srv)
	defer s.removeSignInClient(uid)

	authSession := pbauth.AuthSession{}
	authSession.State = pbauth.AuthState_USER_SIGNED_IN
	authSession.AccessToken = "accessToken123"
	authSession.RefreshToken = "refreshToken123"

	if err := srv.Send(&authSession); err != nil {
		log.Printf("send err: %v", err)
		return err
	}

	/*rxgo.Just(srv)(rxgo.WithContext(srv.Context())).Map(func(ctx context.Context, item interface{}) (ss interface{}, err error) {
		return &item, nil
	}).Observe()*/

	/*observable := rxgo.Just(in)(rxgo.WithContext(srv.Context())).Filter(func(resp interface{}) bool {
		as := resp.(*pbauth.SignInRequest)
		return as.GetCredentials().Username == "David2"
	})

	observable.Observe()*/

	/*obs.Filter(func(resp interface{}) bool {
		//as := resp.(*pbauth.SignInRequest)
		//return as.GetCredentials().Username == "David"
		return false
	})*/

	/*for x := range obs.Observe(rxgo.WithContext(srv.Context())) {
		if x.Error() {
			return srv.Context().Err()
		}
		fmt.Println(x)
	}*/

	// obs.Connect()

	<-obs.Filter(func(resp interface{}) bool {
		/*as := resp.(*pbauth.SignInRequest)
		return as.GetCredentials().Username == "David"*/
		return true
	}).ForEach(func(v interface{}) {
		fmt.Printf("received: %v\n", v)
	}, func(err error) {
		fmt.Printf("error: %e\n", err)
	}, func() {
		fmt.Println("observable is closed")
	}, rxgo.WithContext(srv.Context()))

	return nil

	/*for {
		select {
		case <-srv.Context().Done():
			return srv.Context().Err()
		}
	}*/
}

func (s *AuthStorageImpl) Signout(ctx context.Context, in *pbauth.SignOutRequest) (*pbauth.SignOutResponse, error) {
	s.Mu.RLock()
	client := s.SignInClients[in.RefreshToken]
	s.Mu.RUnlock()

	if client == nil {
		return nil, errors.New("client not found")
	}

	authSession := pbauth.AuthSession{}
	authSession.State = pbauth.AuthState_USER_SIGNED_OUT

	/*if err := client.Send(&authSession); err != nil {
		log.Printf("send err: %v", err)
		return nil, err
	}*/

	/*producer := func(ctx context.Context, next <-chan rxgo.Item) {
		next <- rxgo.Of(1)
		next <- rxgo.Of(2)
		next <- rxgo.Of(3)
	}*/
	/*go producer(ctx, ch) {

	}*/
	/*go producer(ctx, ch) {
		i := 0
		for range time.Tick(time.Second) {
			// ch <- rxgo.Of(i)
			i++
		}
	}*/

	go func() {
		i := 0
		// ch <- rxgo.Of(i)
		for range time.Tick(time.Second) {
			ch <- rxgo.Of(i)
			i++
		}
	}()

	signoutResponse := pbauth.SignOutResponse{}
	signoutResponse.State = pbauth.AuthState_USER_SIGNED_OUT

	return &signoutResponse, nil
}
