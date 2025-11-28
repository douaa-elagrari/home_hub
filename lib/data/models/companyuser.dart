import 'Baseuser.dart';

class CompanyUser extends UserModel {
  final String companyName;

  CompanyUser({
    int? id,
    required String username,
    required String email,
    required String password,
    required this.companyName,
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
      "id": id,
      "userType": userType,
      "username": username,
      "email": email,
      "password": password,
      "companyName": companyName,
      "fullName": null,
      "birthDate": null,
      "address": null,
    };
  }
}
