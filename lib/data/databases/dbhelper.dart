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
        await db.execute(DatabaseConfig.createFreelancerTable); // Add this
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Add new columns to users table for freelancers
          await db.execute('ALTER TABLE users ADD COLUMN profession TEXT');
          await db.execute('ALTER TABLE users ADD COLUMN city TEXT');

          // If freelancer table exists, migrate data and drop it
          try {
            // Check if freelancer table exists
            final tables = await db.rawQuery(
              "SELECT name FROM sqlite_master WHERE type='table' AND name='freelancer'",
            );

            if (tables.isNotEmpty) {
              // Migrate data from freelancer to users table
              final freelancers = await db.query('freelancer');

              for (var freelancer in freelancers) {
                await db.insert('users', {
                  'name': freelancer['username'],
                  'email': freelancer['email'],
                  'password': freelancer['password'],
                  'type': 'freelancer',
                  'fname': freelancer['fullName'],
                  'phone': freelancer['phone'],
                  'profession': freelancer['profession'],
                  'city': freelancer['city'],
                });
              }

              // Drop the old freelancer table
              await db.execute('DROP TABLE freelancer');
            }
          } catch (e) {
            print("Migration error (non-critical): $e");
          }
        }

        if (oldVersion < 3) {
          // Create new freelancer table for job cards
          await db.execute(DatabaseConfig.createFreelancerTable);
        }
      },
    );

    return _database!;
  }

  static Future<int> deleteAgencyByTitle(String title) async {
    final db = await getDatabase();
    return await db.delete('agency', where: 'title = ?', whereArgs: [title]);
  }
}
