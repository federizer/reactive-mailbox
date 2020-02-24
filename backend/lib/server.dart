import 'dart:async';
import 'package:args/args.dart';
import 'package:grpc/grpc.dart';


import 'package:server/api/generated/google/protobuf/empty.pb.dart';
import 'package:server/api/generated/auth.pb.dart';
import 'package:server/api/generated/auth_session.pbgrpc.dart';

class AuthSessionService extends AuthSessionServiceBase {
  @override
  Future<SignupResponse> signup(ServiceCall call, SignupRequest request) async {
    return SignupResponse()..token = 'Hello, ${request.username}!';
  }
  @override
  Future<SigninResponse> signin(ServiceCall call, SigninRequest request) async {
    return SigninResponse()..token = 'Hello, ${request.username}!';
  }
  @override
  Future<SignoutResponse> signout(ServiceCall call, SignoutRequest request) async {
    return SignoutResponse();
  }
  @override
  Stream<AuthSessionResponse> requestAuthSession(ServiceCall call, AuthSessionRequest request) async* {
    print(request.token);

    yield AuthSessionResponse();
  }
}

Future<void> main(List<String> args) async {
  final server = Server([AuthSessionService()]);
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}');
}