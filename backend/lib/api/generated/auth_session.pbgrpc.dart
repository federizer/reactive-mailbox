///
//  Generated code. Do not modify.
//  source: auth_session.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'auth_session.pb.dart' as $0;
import 'auth.pb.dart' as $1;
export 'auth_session.pb.dart';

class AuthSessionServiceClient extends $grpc.Client {
  static final _$requestAuthSession =
      $grpc.ClientMethod<$0.AuthSessionRequest, $0.AuthSessionResponse>(
          '/auth.AuthSessionService/RequestAuthSession',
          ($0.AuthSessionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AuthSessionResponse.fromBuffer(value));
  static final _$signup =
      $grpc.ClientMethod<$1.SignupRequest, $1.SignupResponse>(
          '/auth.AuthSessionService/Signup',
          ($1.SignupRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SignupResponse.fromBuffer(value));
  static final _$signin =
      $grpc.ClientMethod<$1.SigninRequest, $1.SigninResponse>(
          '/auth.AuthSessionService/Signin',
          ($1.SigninRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SigninResponse.fromBuffer(value));
  static final _$signout =
      $grpc.ClientMethod<$1.SignoutRequest, $1.SignoutResponse>(
          '/auth.AuthSessionService/Signout',
          ($1.SignoutRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.SignoutResponse.fromBuffer(value));

  AuthSessionServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<$0.AuthSessionResponse> requestAuthSession(
      $0.AuthSessionRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$requestAuthSession, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$1.SignupResponse> signup($1.SignupRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$signup, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.SigninResponse> signin($1.SigninRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$signin, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.SignoutResponse> signout($1.SignoutRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$signout, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class AuthSessionServiceBase extends $grpc.Service {
  $core.String get $name => 'auth.AuthSessionService';

  AuthSessionServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.AuthSessionRequest, $0.AuthSessionResponse>(
            'RequestAuthSession',
            requestAuthSession_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.AuthSessionRequest.fromBuffer(value),
            ($0.AuthSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SignupRequest, $1.SignupResponse>(
        'Signup',
        signup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SignupRequest.fromBuffer(value),
        ($1.SignupResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SigninRequest, $1.SigninResponse>(
        'Signin',
        signin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SigninRequest.fromBuffer(value),
        ($1.SigninResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SignoutRequest, $1.SignoutResponse>(
        'Signout',
        signout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SignoutRequest.fromBuffer(value),
        ($1.SignoutResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.AuthSessionResponse> requestAuthSession_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.AuthSessionRequest> request) async* {
    yield* requestAuthSession(call, await request);
  }

  $async.Future<$1.SignupResponse> signup_Pre(
      $grpc.ServiceCall call, $async.Future<$1.SignupRequest> request) async {
    return signup(call, await request);
  }

  $async.Future<$1.SigninResponse> signin_Pre(
      $grpc.ServiceCall call, $async.Future<$1.SigninRequest> request) async {
    return signin(call, await request);
  }

  $async.Future<$1.SignoutResponse> signout_Pre(
      $grpc.ServiceCall call, $async.Future<$1.SignoutRequest> request) async {
    return signout(call, await request);
  }

  $async.Stream<$0.AuthSessionResponse> requestAuthSession(
      $grpc.ServiceCall call, $0.AuthSessionRequest request);
  $async.Future<$1.SignupResponse> signup(
      $grpc.ServiceCall call, $1.SignupRequest request);
  $async.Future<$1.SigninResponse> signin(
      $grpc.ServiceCall call, $1.SigninRequest request);
  $async.Future<$1.SignoutResponse> signout(
      $grpc.ServiceCall call, $1.SignoutRequest request);
}
