abstract class UserModel {
  final int? id;
  final String username;
  final String email;
  final String password;
  final String userType;

  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.userType,
  });

  Map<String, dynamic> toMap();
}
