import 'dart:async';
import 'package:args/args.dart';
import 'package:grpc/grpc.dart';

import 'package:server/grpc_services/auth.dart' as grpc_services;
import 'package:server/grpc_services/system.dart' as grpc_services;

Future<void> main(List<String> args) async {
  final server = Server(
      [grpc_services.AuthService(), grpc_services.SystemService()]);
  await server.serve(port: 8080);
  print('Server listening on port ${server.port}');
}
