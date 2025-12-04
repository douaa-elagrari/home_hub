import 'package:homehub/data/models/results.dart';
import '../models/results.dart';
import '../models/Baseuser.dart';
import 'user_db_repo.dart';

abstract class UserRepo {
  Future<bool> signup(UserModel user);
  Future<UserModel?> login(String email, String password);
  Future<bool> usernameExists(String username);
  Future<bool> emailExists(String email); 

  static UserRepo? _instance;

  static UserRepo getInstance() {
    _instance ??= UserDBRepo();
    return _instance!;
  }
}
