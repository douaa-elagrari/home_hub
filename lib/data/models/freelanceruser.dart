import 'Baseuser.dart';

class FreelancerUserModel extends UserModel {
  final String fullName;
  final String birthDate;
  final String address;
  final String? phone;

  FreelancerUserModel({
    int? id,
    required String username,
    required String email,
    required String password,
    required this.fullName,
    required this.birthDate,
    required this.address,
    this.phone,
  }) : super(
         id: id,
         username: username,
         email: email,
         password: password,
         userType: "freelancer",
       );

  @override
  Map<String, dynamic> toMap() {
    return {
      // Don't include "id" - it's auto-increment
      "type": userType, // ✅ Changed from "userType"
      "name": username, // ✅ Changed from "username"
      "email": email,
      "password": password,
      "fname": fullName, // ✅ Changed from "fullName"
      "bd": birthDate, // ✅ Changed from "birthDate"
      "addr": address, // ✅ Changed from "address"
      "phone": phone, // ⭐ ADDED
    };
  }
}
