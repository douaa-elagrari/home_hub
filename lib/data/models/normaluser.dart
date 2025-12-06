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
    String? profilePicture,
  }) : super(
         id: id,
         username: username,
         email: email,
         password: password,
         userType: "normal",
         profilePicture: profilePicture,
       );

  @override
  Map<String, dynamic> toMap() {
    return {
  
      "type": userType, 
      "name": username, 
      "email": email, 
      "password": password,
      "fname": fullName, 
      "bd": birthDate,
      "addr": address, 

    };
  }
}

