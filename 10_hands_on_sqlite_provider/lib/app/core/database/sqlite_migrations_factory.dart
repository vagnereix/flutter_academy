import 'migrations/migration.dart';
import 'migrations/migration_v1.dart';
import 'migrations/migration_v2.dart';
import 'migrations/migration_v3.dart';

class SqliteMigrationsFactory {
  List<Migration> getCreateMigrations() {
    return [
      MigrationV1(),
      MigrationV2(),
      MigrationV3(),
    ];
  }

  List<Migration> getUpdateMigrations(int version) {
    final migrations = getCreateMigrations();

    return migrations.sublist(version);
  }

  // Testar quais migrations serão executadas de acordo com a versão recebida
  // void main() {
  //   print(['v1', 'v2', 'v3'].sublist(2));
  // }
}
