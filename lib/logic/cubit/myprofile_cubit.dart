// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyProfileState {
//   final String username;

//   MyProfileState({this.username = ""});

//   MyProfileState copyWith({String? username}) =>
//       MyProfileState(username: username ?? this.username);
// }

// class MyProfileCubit extends Cubit<MyProfileState> {
//   MyProfileCubit() : super(MyProfileState());

//   // Load username from SharedPreferences
//   Future<void> loadUsername() async {
//     final prefs = await SharedPreferences.getInstance();
//     final username = prefs.getString('logged_username') ?? "User Name";
//     emit(state.copyWith(username: username));
//   }

//   // Update username in SharedPreferences
//   Future<void> updateUsername(String newUsername) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('logged_username', newUsername);
//     emit(state.copyWith(username: newUsername));
//   }
// }

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../data/repositories/user_db_repo.dart';
// import '../../../data/repositories/user_repo.dart';

// class MyProfileState {
//   final String username;
//   final String error;

//   MyProfileState({this.username = "", this.error = ""});

//   MyProfileState copyWith({String? username, String? error}) =>
//       MyProfileState(
//         username: username ?? this.username,
//         error: error ?? this.error,
//       );
// }

// class MyProfileCubit extends Cubit<MyProfileState> {
//   final UserDBRepo _repo = UserRepo.getInstance() as UserDBRepo;

//   MyProfileCubit() : super(MyProfileState());

//   Future<void> loadUsername() async {
//     final prefs = await SharedPreferences.getInstance();
//     final storedUsername = prefs.getString("logged_username");

//     if (storedUsername == null) {
//       emit(state.copyWith(error: "User not logged in"));
//       return;
//     }

//     // Validate user still exists
//     final exists = await _repo.usernameExists(storedUsername);
//     if (!exists) {
//       await prefs.remove("logged_username");
//       await prefs.remove("logged_user_id");
//       emit(state.copyWith(error: "User does not exist anymore"));
//       return;
//     }

//     emit(state.copyWith(username: storedUsername, error: ""));
//   }

//   Future<void> logout() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove("logged_username");
//     await prefs.remove("logged_user_id");
//     emit(MyProfileState());
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/repositories/user_db_repo.dart';
import '../../../data/repositories/user_repo.dart';

class MyProfileState {
  final String username;
  final String error;

  MyProfileState({this.username = "", this.error = ""});

  MyProfileState copyWith({String? username, String? error}) => MyProfileState(
    username: username ?? this.username,
    error: error ?? this.error,
  );
}

class MyProfileCubit extends Cubit<MyProfileState> {
  final UserDBRepo _repo = UserRepo.getInstance() as UserDBRepo;

  MyProfileCubit() : super(MyProfileState());

  Future<void> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString("logged_username");

    if (storedUsername == null) {
      emit(state.copyWith(error: "User not logged in"));
      return;
    }

    final exists = await _repo.usernameExists(storedUsername);
    if (!exists) {
      await prefs.clear(); // clear everything if user doesn't exist
      emit(state.copyWith(error: "User does not exist anymore"));
      return;
    }

    emit(state.copyWith(username: storedUsername, error: ""));
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // remove all session info
    emit(MyProfileState()); // reset state
  }
}
