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
  //
  @override
  Future<ReturnResult> signup(UserModel user) async {
    try {
      final db = await _db();
      await db.insert(table, user.toMap());
      return ReturnResult(state: false, message: 'signed in successfully ');
    } catch (e) {
      print("Register error: $e");
      return ReturnResult(state: false, message: 'Cannot sign up');
    }
  }

  @override
  Future<UserModel?> login(String email, String password) async {
    final db = await _db();

    final result = await db.query(
      table,
      where: "userEmail = ? AND userPassword = ?",
      whereArgs: [email, password],
    );

    if (result.isEmpty) return null;

    return _mapToUser(result.first);
  }

  UserModel _mapToUser(Map<String, dynamic> data) {
    final type = data["userType"];

    switch (type) {
      case "company":
        return CompanyUserModel(
          id: data["userId"],
          username: data["userName"],
          email: data["userEmail"],
          password: data["userPassword"],
          companyName: data["companyName"] ?? "",
        );

      case "freelancer":
        return FreelancerUserModel(
          id: data["userId"],
          username: data["userName"],
          email: data["userEmail"],
          password: data["userPassword"],
          fullName: data["fullname"] ?? "",
          birthDate: data["birthdate"] ?? "",
          address: data["address"] ?? "",
        );

      case "normal":
        return NormalUserModel(
          id: data["userId"],
          username: data["userName"],
          email: data["userEmail"],
          password: data["userPassword"],
          fullName: data["fullname"] ?? "",
          birthDate: data["birthdate"] ?? "",
          address: data["address"] ?? "",
        );

      default:
        throw Exception("Unknown user type: $type");
    }
  }
}
