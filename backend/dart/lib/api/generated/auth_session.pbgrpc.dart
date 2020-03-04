///
//  Generated code. Do not modify.
//  source: auth_session.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'auth.pb.dart' as $0;
import 'auth_session.pb.dart' as $1;
export 'auth_session.pb.dart';

class AuthSessionServiceClient extends $grpc.Client {
  static final _$signup = $grpc.ClientMethod<$0.SignUpRequest, $1.AuthSession>(
      '/auth.AuthSessionService/Signup',
      ($0.SignUpRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.AuthSession.fromBuffer(value));
  static final _$signin = $grpc.ClientMethod<$0.SignInRequest, $1.AuthSession>(
      '/auth.AuthSessionService/Signin',
      ($0.SignInRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.AuthSession.fromBuffer(value));
  static final _$signout =
      $grpc.ClientMethod<$0.SignOutRequest, $0.SignOutResponse>(
          '/auth.AuthSessionService/Signout',
          ($0.SignOutRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SignOutResponse.fromBuffer(value));

  AuthSessionServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<$1.AuthSession> signup($0.SignUpRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$signup, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseStream<$1.AuthSession> signin($0.SignInRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$signin, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.SignOutResponse> signout($0.SignOutRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$signout, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class AuthSessionServiceBase extends $grpc.Service {
  $core.String get $name => 'auth.AuthSessionService';

  AuthSessionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SignUpRequest, $1.AuthSession>(
        'Signup',
        signup_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SignUpRequest.fromBuffer(value),
        ($1.AuthSession value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignInRequest, $1.AuthSession>(
        'Signin',
        signin_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SignInRequest.fromBuffer(value),
        ($1.AuthSession value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignOutRequest, $0.SignOutResponse>(
        'Signout',
        signout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignOutRequest.fromBuffer(value),
        ($0.SignOutResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$1.AuthSession> signup_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignUpRequest> request) async* {
    yield* signup(call, await request);
  }

  $async.Stream<$1.AuthSession> signin_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignInRequest> request) async* {
    yield* signin(call, await request);
  }

  $async.Future<$0.SignOutResponse> signout_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignOutRequest> request) async {
    return signout(call, await request);
  }

  $async.Stream<$1.AuthSession> signup(
      $grpc.ServiceCall call, $0.SignUpRequest request);
  $async.Stream<$1.AuthSession> signin(
      $grpc.ServiceCall call, $0.SignInRequest request);
  $async.Future<$0.SignOutResponse> signout(
      $grpc.ServiceCall call, $0.SignOutRequest request);
}
