import 'dart:async';
import 'package:grpc/grpc.dart';

import 'package:server/api/generated/google/protobuf/empty.pb.dart';
import 'package:server/api/generated/auth.pb.dart';
import 'package:server/api/generated/system.pbgrpc.dart';

class SystemService extends SystemServiceBase {
  @override
  Future<AliveResponse> alive(
      ServiceCall call, Empty request) async {
    return AliveResponse()..msg = 'Hello, I am alive!';
  }
}