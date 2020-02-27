import 'package:postgres_pool/postgres_pool.dart';

class Database {

  static PgPool _pgpool;

  static getPgPool() {
    if (_pgpool == null) {
      _pgpool = PgPool(
        PgEndpoint(
            host: 'localhost',
            port: 5432,
            database: 'reactive_mailbox',
            username: 'admin',
            password: 'admin'),
      );
    }
    return _pgpool;
  }

  void dispose() {
    _pgpool.close();
  }
}
