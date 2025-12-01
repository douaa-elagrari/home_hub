import 'package:homehub/data/models/results.dart';
import '../models/results.dart';
import '../models/Baseuser.dart';
import 'user_db_repo.dart';

abstract class UserRepo {
  Future<ReturnResult> signup(UserModel user);
  Future<UserModel?> login(String email, String password);

  static UserRepo? _instance;

  static UserRepo getInstance() {
    _instance ??= UserDBRepo(); //singeleton
    return _instance!;
  }
}
