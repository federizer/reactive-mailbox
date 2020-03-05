import 'dart:async';
import 'package:grpc/grpc.dart';

import 'package:server/api/generated/google/protobuf/empty.pb.dart';
import 'package:server/api/generated/auth.pb.dart';
import 'package:server/api/generated/auth_session.pbgrpc.dart';

import 'package:server/storage/auth.dart' as storage;

class AuthService extends AuthServiceBase {
  StreamController<AuthSession> _controllerAuthSession =
  StreamController<AuthSession>.broadcast(onListen: () {
    print("onListen");
  }, onCancel: () {
    print("onCancel");
  });

  @override
  Stream<AuthSession> signup(ServiceCall call, SignUpRequest request) async* {
    yield* storage.AuthSessionStorage.signup(request);
    /*if (request.credentials.username.compareTo('Mike') == 0 &&
        request.credentials.password.compareTo('1234') == 0) {
      yield AuthSession()
        ..refreshToken = 'token1234'
        ..state = AuthState.USER_SIGNED_UP;
      yield* _controllerAuthSession.stream.where((AuthSession resp) {
        return resp.refreshToken == 'token1234';
      });
    } else if (request.credentials.username.compareTo('David') == 0 &&
        request.credentials.password.compareTo('5678') == 0) {
      yield AuthSession()
        ..refreshToken = 'token5678'
        ..state = AuthState.USER_SIGNED_UP;
      yield* _controllerAuthSession.stream.where((AuthSession resp) {
        return resp.refreshToken == 'token5678';
      });
    } else {
      yield AuthSession()..state = AuthState.FAILURE;
    }*/
  }

  @override
  Stream<AuthSession> signin(ServiceCall call, SignInRequest request) async* {
    if (request.credentials.username.compareTo('Mike') == 0 &&
        request.credentials.password.compareTo('1234') == 0) {
      yield AuthSession()
        ..refreshToken = 'token1234'
        ..state = AuthState.USER_SIGNED_IN;
      yield* _controllerAuthSession.stream.where((AuthSession resp) {
        return resp.refreshToken == 'token1234';
      });
    } else if (request.credentials.username.compareTo('David') == 0 &&
        request.credentials.password.compareTo('5678') == 0) {
      yield AuthSession()
        ..refreshToken = 'token5678'
        ..state = AuthState.USER_SIGNED_IN;
      yield* _controllerAuthSession.stream.where((AuthSession resp) {
        return resp.refreshToken == 'token5678';
      });
    } else {
      yield AuthSession()..state = AuthState.FAILURE;
    }
  }

  @override
  Future<SignOutResponse> signout(
      ServiceCall call, SignOutRequest request) async {
    if (request.refreshToken.compareTo('token1234') == 0) {
      _controllerAuthSession.sink.add(
        AuthSession()
          ..refreshToken = request.refreshToken
          ..state = AuthState.USER_SIGNED_OUT,
      );
      return SignOutResponse()..state = AuthState.SUCCESS;
    }
    if (request.refreshToken.compareTo('token5678') == 0) {
      _controllerAuthSession.sink.add(
        AuthSession()
          ..refreshToken = request.refreshToken
          ..state = AuthState.USER_SIGNED_OUT,
      );
      return SignOutResponse()..state = AuthState.SUCCESS;
    }
    return SignOutResponse()..state = AuthState.FAILURE;
  }

  void dispose() {
    _controllerAuthSession.close();
  }
}