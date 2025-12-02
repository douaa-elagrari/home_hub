import 'Baseuser.dart';

class NormalUserModel extends UserModel {
  final String fullName;
  final String birthDate;
  final String address;

  NormalUserModel({
    int? id,
    required String username,
    required String email,
    required String password,
    required this.fullName,
    required this.birthDate,
    required this.address,
  }) : super(
         id: id,
         username: username,
         email: email,
         password: password,
         userType: "normal",
       );

  @override
  Map<String, dynamic> toMap() {
    return {
      // Use the EXACT column names from your DatabaseConfig!
      // Don't include "id" - it's auto-increment
      "type": userType, // Changed from "userType" to "type"
      "name": username, // Changed from "username" to "name"
      "email": email, // ✓ This one is correct
      "password": password, // ✓ This one is correct
      "fname": fullName, // Changed from "fullName" to "fname"
      "bd": birthDate, // Changed from "birthDate" to "bd"
      "addr": address, // Changed from "address" to "addr"
      // Don't include "cname" (companyName) for normal users
    };
  }
}
