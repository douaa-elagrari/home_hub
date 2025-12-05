import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database_config.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    _database = await openDatabase(
      join(await getDatabasesPath(), DatabaseConfig.databaseName),
      version: DatabaseConfig.databaseVersion,
      onCreate: (db, version) async {
        await db.execute(DatabaseConfig.createUsersTable);
        await db.execute(DatabaseConfig.createProductsTable);
        await db.execute(DatabaseConfig.createAgencyTable); 
      },
    );

    return _database!;
  }
}
