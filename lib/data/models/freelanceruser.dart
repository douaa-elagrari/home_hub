import 'Baseuser.dart';

class FreelancerUserModel extends UserModel {
  final String fullName;
  final String? phone;
  final String profession;
  final String city;

  FreelancerUserModel({
    int? id,
    required String username,
    required String email,
    required String password,
    required this.fullName,
    this.phone,
    required this.profession,
    required this.city,
    String? profilePicture,
  }) : super(
         id: id,
         username: username,
         email: email,
         password: password,
         userType: "freelancer",
         profilePicture: profilePicture,
       );

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "email": email,
      "password": password,
      "fullName": fullName,
      "phone": phone,
      "profession": profession,
      "city": city,
    };
  }

  factory FreelancerUserModel.fromMap(Map<String, dynamic> map) {
    return FreelancerUserModel(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      fullName: map['fullName'],
      phone: map['phone'],
      profession: map['profession'],
      city: map['city'],
    );
  }

  // Assign ID after insert
  FreelancerUserModel copyWithId(int newId) {
    return FreelancerUserModel(
      id: newId,
      username: username,
      email: email,
      password: password,
      fullName: fullName,
      phone: phone,
      profession: profession,
      city: city,
    );
  }
}
