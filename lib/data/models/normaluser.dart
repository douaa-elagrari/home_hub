import 'Baseuser.dart';

class NormalUser extends UserModel {
  final String fullName;
  final String birthDate;
  final String address;

  NormalUser({
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
      "id": id,
      "userType": userType,
      "username": username,
      "email": email,
      "password": password,
      "fullName": fullName,
      "birthDate": birthDate,
      "address": address,
      "companyName": null,
    };
  }
}
