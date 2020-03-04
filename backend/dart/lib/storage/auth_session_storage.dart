import 'dart:async';
import 'package:uuid/uuid.dart';

import 'package:server/api/generated/auth/auth.pb.dart';
import 'package:server/api/generated/auth/auth_session.pbgrpc.dart';

import 'package:server/utils/database.dart';
import 'package:server/utils/jwt.dart';

class AuthSessionStorage {
  static Stream<AuthSession> signup(SignUpRequest request) async* {
    final pool = Database.getPgPool();

    final rs = await pool.execute(
        'INSERT INTO auth.user VALUES (@id, @username, @password_hash);',
        substitutionValues: {
          'id': Uuid().v4(),
          'username': 'mike',
          'password_hash': '1234'
        });

    final jwt = await Jwt.token();
    /*final payload = {
      'username': request.credentials.username,
      'exp': 1300819380,
      'http://example.com/is_root': true
    };
    final token = jwt.encode(payload);*/

    yield AuthSession()
      ..refreshToken = jwt
      ..state = AuthState.USER_SIGNED_UP;
  }
}
