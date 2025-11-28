import '../models/Baseuser.dart';
import '../models/companyuser.dart';
import '../models/freelanceruser.dart';
import '../models/normaluser.dart';
import '../databases/dbhelper.dart';
import 'user_repo.dart';

// class UserDBRepo extends UserRepo {
//   @override
//   Future<bool> register(UserModel user) async {
//     final db = await DBHelper.getDatabase();
//     await db.insert(
//       "users",
//       user.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     return true;
//   }

//   @override
//   Future<UserModel?> login(String username, String password) async {
//     final db = await DBHelper.getDatabase();
//     final result = await db.query(
//       "users",
//       where: "username = ? AND password = ?",
//       whereArgs: [username, password],
//     );

//     if (result.isEmpty) return null;

//     final row = result.first;

//     switch (row["userType"]) {
//       case "normal":
//         return NormalUser(
//           id: row["id"],
//           username: row["username"],
//           email: row["email"],
//           password: row["password"],
//           fullName: row["fullName"],
//           birthDate: row["birthDate"],
//           address: row["address"],
//         );

//       case "company":
//         return CompanyUser(
//           id: row["id"],
//           username: row["username"],
//           email: row["email"],
//           password: row["password"],
//           companyName: row["companyName"],
//         );

//       case "freelancer":
//         return FreelancerUser{
//     }

//     return null;
//   }
// }
