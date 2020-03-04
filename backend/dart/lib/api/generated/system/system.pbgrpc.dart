///
//  Generated code. Do not modify.
//  source: system.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'google/protobuf/empty.pb.dart' as $0;
import 'system.pb.dart' as $1;
export 'system.pb.dart';

class SystemServiceClient extends $grpc.Client {
  static final _$alive = $grpc.ClientMethod<$0.Empty, $1.AliveResponse>(
      '/system.SystemService/Alive',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.AliveResponse.fromBuffer(value));

  SystemServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$1.AliveResponse> alive($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$alive, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class SystemServiceBase extends $grpc.Service {
  $core.String get $name => 'system.SystemService';

  SystemServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.AliveResponse>(
        'Alive',
        alive_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.AliveResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.AliveResponse> alive_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return alive(call, await request);
  }

  $async.Future<$1.AliveResponse> alive(
      $grpc.ServiceCall call, $0.Empty request);
}
