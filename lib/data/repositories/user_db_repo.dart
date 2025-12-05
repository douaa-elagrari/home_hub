import 'package:sqflite/sqflite.dart';
import '../databases/dbhelper.dart';
import '../models/Baseuser.dart';
import '../models/companyuser.dart';
import '../models/freelanceruser.dart';
import '../models/normaluser.dart';
import 'user_repo.dart';
import '../models/results.dart';

class UserDBRepo implements UserRepo {
  static const String table = "users";

  Future<Database> _db() async => await DBHelper.getDatabase();

  @override
  Future<bool> signup(UserModel user) async {
    try {
      final db = await _db();
      final id = await db.insert(table, user.toMap());
      return true;
    } catch (e) {
      print("❌ Register error: $e");
      return false;
    }
  }

  @override
  Future<bool> emailExists(String email) async {
    final db = await _db();
    final result = await db.query(
      table,
      where: "email = ?",
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  @override
  Future<bool> usernameExists(String username) async {
    final db = await _db();
    final result = await db.query(
      table,
      where: "name = ?",
      whereArgs: [username],
    );
    return result.isNotEmpty;
  }

  @override
  Future<UserModel?> login(String usernameOrEmail, String password) async {
    if (usernameOrEmail.isEmpty || password.isEmpty) return null;

    final db = await _db();
    final result = await db.query(
      table,
      where: "(name = ? OR email = ?) AND password = ?",
      whereArgs: [usernameOrEmail, usernameOrEmail, password],
      limit: 1,
    );

    if (result.isEmpty) return null;

    return _mapToUser(result.first);
  }

  @override
  UserModel _mapToUser(Map<String, dynamic> data) {
    final type = data["type"];
    switch (type) {
      case "company":
        return CompanyUserModel(
          id: data["id"],
          username: data["name"],
          email: data["email"],
          password: data["password"],
          companyName: data["cname"] ?? "",
          phone: data["phone"] ?? "",
          vatNumber: data["vat"] ?? "",
          location: data["location"] ?? "",
          description: data["description"] ?? "",
        );
      case "freelancer":
        return FreelancerUserModel(
          id: data["id"],
          username: data["name"],
          email: data["email"],
          password: data["password"],
          fullName: data["fname"] ?? "",
          birthDate: data["bd"] ?? "",
          address: data["addr"] ?? "",
          phone: data["phone"] ?? "",
          profession: data["profession"] ?? "", // NEW
          city: data["city"] ?? "",             // NEW
        );
      case "normal":
        return NormalUserModel(
          id: data["id"],
          username: data["name"],
          email: data["email"],
          password: data["password"],
          fullName: data["fname"] ?? "",
          birthDate: data["bd"] ?? "",
          address: data["addr"] ?? "",
        );
      default:
        throw Exception("Unknown user type: $type");
    }
  }
}
