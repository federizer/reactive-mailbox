import 'dart:async';

import 'package:server/api/generated/auth.pb.dart';
import 'package:server/api/generated/auth_session.pbgrpc.dart';

import 'package:server/utils/database.dart';

class AuthSessionStorage {
  static Stream<AuthSession> signup(SignUpRequest request) async* {
    /*final pool = Database.getPgPool();

    await pool.execute('CREATE TABLE tbl(id TEXT PRIMARY KEY);');*/

    final futures = <Future>[];

    final f = Database.getPgPool().run((c) async {
      final rs = await c.query(
//        'SELECT COUNT(*) FROM auth.user WHERE username = @username',
//        substitutionValues: {
//          'username': 'mike@foo.org',
//        },
        'SELECT COUNT(*) FROM auth.user',
      );
      return rs[0][0];
    });

    futures.add(f);

    await Future.wait(futures);

    yield AuthSession()
      ..refreshToken = 'token1234'
      ..state = AuthState.USER_SIGNED_UP;
  }
}
