import 'Baseuser.dart';

class CompanyUserModel extends UserModel {
  final String companyName;
  final String? phone;
  final String? vatNumber;
  final String? location;
  final String? description;

  CompanyUserModel({
    int? id,
    required String username,
    required String email,
    required String password,
    required this.companyName,
    this.phone,
    this.vatNumber,
    this.location,
    this.description,
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
      "type": userType,
      "name": username,
      "email": email,
      "password": password,
      "cname": companyName,
      "phone": phone,
      "vat": vatNumber,
      "location": location,
      "description": description,
    };
  }
}
