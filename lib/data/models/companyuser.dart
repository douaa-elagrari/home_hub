import 'Baseuser.dart';

class CompanyUserModel extends UserModel {
  final String companyName;
  final String? phone;
  final String? vatNumber;

  CompanyUserModel({
    int? id,
    required String username,
    required String email,
    required String password,
    required this.companyName,
    this.phone,
    this.vatNumber,
  }) : super(
         id: id,
         username: username,
         email: email,
         password: password,
         userType: "company",
       );

  @override
  Map<String, dynamic> toMap() {
    return {
      // Don't include "id" - it's auto-increment
      "type": userType, // ✅ Changed from "userType"
      "name": username, // ✅ Changed from "username"
      "email": email,
      "password": password,
      "cname": companyName, // ✅ Changed from "companyName"
      "phone": phone, // ⭐ ADDED
      "vat": vatNumber, // ⭐ ADDED
    };
  }
}
