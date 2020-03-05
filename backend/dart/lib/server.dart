import 'dart:async';
import 'package:args/args.dart';
import 'package:grpc/grpc.dart';

import 'package:server/grpc_services/auth_session_service.dart';

Future<void> main(List<String> args) async {
  final server = Server([AuthSessionService()]);
  await server.serve(port: 8080);
  print('Server listening on port ${server.port}');
}
