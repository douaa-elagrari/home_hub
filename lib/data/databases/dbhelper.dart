import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database_config.dart';

class DBHelper {
  static const _dbName = "HomeHub.db";
  static const _dbVersion = 1;
  static Database? _database;

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    _database = await openDatabase(
      join(await getDatabasesPath(), _dbName),
      version: _dbVersion,
      onCreate: (db, version) {
        db.execute(DatabaseConfig.createTables);
      },
    );

    return _database!;
  }
}
