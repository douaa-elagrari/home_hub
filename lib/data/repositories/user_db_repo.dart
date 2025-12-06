import 'package:sqflite/sqflite.dart';
import '../databases/dbhelper.dart';
import '../models/Baseuser.dart';
import '../models/companyuser.dart';
import '../models/freelanceruser.dart';
import '../models/normaluser.dart';
import 'user_repo.dart';

class UserDBRepo implements UserRepo {
  static const String table = "users";

  Future<Database> _db() async => await DBHelper.getDatabase();

  @override
  Future<bool> signup(UserModel user) async {
    try {
      final db = await _db();

      // Convert UserModel to appropriate map based on type
      Map<String, dynamic> data;

      if (user.userType == "freelancer") {
        FreelancerUserModel freelancer = user as FreelancerUserModel;
        data = {
          "name": freelancer.username,
          "email": freelancer.email,
          "password": freelancer.password,
          "type": "freelancer",
          "fname": freelancer.fullName,
          "phone": freelancer.phone,
          "profession": freelancer.profession,
          "city": freelancer.city,
        };
      } else if (user.userType == "company") {
        CompanyUserModel company = user as CompanyUserModel;
        data = {
          "name": company.username,
          "email": company.email,
          "password": company.password,
          "type": "company",
          "cname": company.companyName,
          "phone": company.phone,
          "vat": company.vatNumber,
          "location": company.location,
          "description": company.description,
        };
      } else {
        // Normal user
        data = user.toMap();
      }

      final id = await db.insert(table, data);
      return id > 0;
    } catch (e) {
      print(" Register error: $e");
      return false;
    }
  }

  @override
  Future<bool> emailExists(String email) async {
    try {
      final db = await _db();
      final result = await db.query(
        table,
        where: "email = ?",
        whereArgs: [email],
      );
      return result.isNotEmpty;
    } catch (e) {
      print(" Check email error: $e");
      return false;
    }
  }

  @override
  Future<bool> usernameExists(String username) async {
    try {
      final db = await _db();
      final result = await db.query(
        table,
        where: "name = ?",
        whereArgs: [username],
      );
      return result.isNotEmpty;
    } catch (e) {
      print(" Check username error: $e");
      return false;
    }
  }

  @override
  Future<UserModel?> login(String usernameOrEmail, String password) async {
    if (usernameOrEmail.isEmpty || password.isEmpty) return null;

    try {
      final db = await _db();
      final result = await db.query(
        table,
        where: "(name = ? OR email = ?) AND password = ?",
        whereArgs: [usernameOrEmail, usernameOrEmail, password],
        limit: 1,
      );

      if (result.isEmpty) return null;

      return _mapToUser(result.first);
    } catch (e) {
      print(" Login error: $e");
      return null;
    }
  }

  @override
  UserModel _mapToUser(Map<String, dynamic> data) {
    final type = data["type"] ?? "normal";

    switch (type) {
      case "company":
        return CompanyUserModel(
          id: data["id"],
          username: data["name"] ?? "",
          email: data["email"] ?? "",
          password: data["password"] ?? "",
          companyName: data["cname"] ?? "",
          phone: data["phone"] ?? "",
          vatNumber: data["vat"] ?? "",
          location: data["location"] ?? "",
          description: data["description"] ?? "",
        );
      case "freelancer":
        return FreelancerUserModel(
          id: data["id"],
          username: data["name"] ?? "",
          email: data["email"] ?? "",
          password: data["password"] ?? "",
          fullName: data["fname"] ?? data["name"] ?? "",
          phone: data["phone"] ?? "",
          profession: data["profession"] ?? "",
          city: data["city"] ?? "",
        );
      default:
        return NormalUserModel(
          id: data["id"],
          username: data["name"] ?? "",
          email: data["email"] ?? "",
          password: data["password"] ?? "",
          fullName: data["fname"] ?? "",
          birthDate: data["bd"] ?? "",
          address: data["addr"] ?? "",
        );
    }
  }

  @override
  Future<UserModel?> getUserByUsername(String username) async {
    try {
      final db = await _db();
      final result = await db.query(
        table,
        where: "name = ?",
        whereArgs: [username],
      );

      if (result.isEmpty) return null;
      return _mapToUser(result.first);
    } catch (e) {
      print("Error fetching user by username: $e");
      return null;
    }
  }

  @override
  Future<bool> updateProfilePicture(
    String username,
    String? profilePicturePath,
  ) async {
    try {
      final db = await _db();
      final result = await db.update(
        table,
        {'profile_pic': profilePicturePath},
        where: 'name = ?',
        whereArgs: [username],
      );
      return result > 0;
    } catch (e) {
      print("Error updating profile picture: $e");
      return false;
    }
  }

  // Optional: Get user by ID
  Future<UserModel?> getUserById(int id) async {
    try {
      final db = await _db();
      final result = await db.query(
        table,
        where: "id = ?",
        whereArgs: [id],
        limit: 1,
      );

      if (result.isEmpty) return null;
      return _mapToUser(result.first);
    } catch (e) {
      print(" Get user by ID error: $e");
      return null;
    }
  }
}
