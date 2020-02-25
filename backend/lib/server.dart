import 'dart:async';
import 'package:args/args.dart';
import 'package:grpc/grpc.dart';

import 'package:server/api/generated/google/protobuf/empty.pb.dart';
import 'package:server/api/generated/auth.pb.dart';
import 'package:server/api/generated/auth_session.pbgrpc.dart';

class AuthSessionService extends AuthSessionServiceBase {
  StreamController<AuthSessionResponse> _controllerAuthSession =
      StreamController<AuthSessionResponse>.broadcast(onListen: () {
    print("onListen");
  }, onCancel: () {
    print("onCancel");
  });

  @override
  Future<SignupResponse> signup(ServiceCall call, SignupRequest request) async {
    return SignupResponse()..token = 'Hello, ${request.username}!';
  }

  @override
  Future<SigninResponse> signin(ServiceCall call, SigninRequest request) async {
    SigninResponse _signinResponse;
    _signinResponse = SigninResponse();
    _signinResponse..token = request.username;
    _controllerAuthSession.sink.add(
      AuthSessionResponse()..token = request.username
      ..signin = _signinResponse,
    );
    return _signinResponse;
  }

  @override
  Future<SignoutResponse> signout(
      ServiceCall call, SignoutRequest request) async {
    return SignoutResponse();
  }

  @override
  Stream<AuthSessionResponse> requestAuthSession(
      ServiceCall call, AuthSessionRequest request) {
    return _controllerAuthSession.stream.where((AuthSessionResponse resp) {
      return resp.token == request.token;
    });
  }
}

Future<void> main(List<String> args) async {
  final server = Server([AuthSessionService()]);
  await server.serve(port: 8080);
  print('Server listening on port ${server.port}');
}
