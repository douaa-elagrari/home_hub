// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../data/models/Baseuser.dart';
// import '../../../data/repositories/user_db_repo.dart';
// import '../../../data/repositories/user_repo.dart';

// class MyProProfile {
//   final String username; // the username to display
//   final String error;

//   MyProProfile({this.username = "", this.error = ""});

//   MyProProfile copyWith({String? username, String? error}) =>
//       MyProProfile(
//         username: username ?? this.username,
//         error: error ?? this.error,
//       );
// }

// class MyProProfileCubit extends Cubit<MyProProfile> {
//   final UserDBRepo _repo = UserRepo.getInstance() as UserDBRepo;

//   MyProProfileCubit() : super(MyProProfile());

//   // Load username from SharedPreferences and validate it in DB
//   Future<void> loadUsername() async {
//     final prefs = await SharedPreferences.getInstance();
//     final storedUsername = prefs.getString('logged_username');

//     if (storedUsername == null) {
//       emit(state.copyWith(error: "No user logged in"));
//       return;
//     }

//     // Check if the username exists in the database
//     final exists = await _repo.usernameExists(storedUsername);
//     if (!exists) {
//       await prefs.remove('logged_username'); // remove invalid username
//       emit(state.copyWith(error: "User does not exist", username: "User Name"));
//       return;
//     }

//     emit(state.copyWith(username: storedUsername, error: ""));
//   }

//   // Logout: clear shared preferences and reset state
//   Future<void> logout() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('logged_username');
//     await prefs.remove('logged_user_id'); // optional if you use user ID
//     emit(MyProProfile(username: "User Name", error: ""));
//   }
// }





import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/repositories/user_db_repo.dart';
import '../../../data/repositories/user_repo.dart';

class MyProProfile {
  final String username; // the username to display
  final String error;

  MyProProfile({this.username = "", this.error = ""});

  MyProProfile copyWith({String? username, String? error}) =>
      MyProProfile(
        username: username ?? this.username,
        error: error ?? this.error,
      );
}

class MyProProfileCubit extends Cubit<MyProProfile> {
  final UserDBRepo _repo = UserRepo.getInstance() as UserDBRepo;

  MyProProfileCubit() : super(MyProProfile());

  Future<void> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString('logged_username');

    if (storedUsername == null) {
      emit(state.copyWith(error: "No user logged in"));
      return;
    }

    final exists = await _repo.usernameExists(storedUsername);
    if (!exists) {
      await prefs.clear(); // clear all invalid info
      emit(state.copyWith(error: "User does not exist", username: "User Name"));
      return;
    }

    emit(state.copyWith(username: storedUsername, error: ""));
  }

  Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear(); // remove all session info
  emit(MyProProfile()); // reset state
}

}
