import 'package:homehub/data/databases/dbhelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/service.dart';

class ServiceRepository {
  const ServiceRepository();

  /// Add a new service
  Future<int> addService(Service service) async {
    final db = await DBHelper.getDatabase();
    return await db.insert("services", service.toMap());
  }

  /// Load services for a specific username
  Future<List<Service>> getServicesForUser(String username) async {
    final db = await DBHelper.getDatabase();
    final rows = await db.query(
      "services",
      where: "username = ?",
      whereArgs: [username],
    );
    return rows.map((e) => Service.fromMap(e)).toList();
  }

  /// Load services for logged-in user
  Future<List<Service>> getLoggedUserServices() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString("logged_username") ?? "";
    if (username.isEmpty) return [];

    return getServicesForUser(username);
  }
}
