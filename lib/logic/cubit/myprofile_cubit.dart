
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
import '../../data/repositories/user_repo.dart';

class MyProfileState {
  final String username;
  final String? profilePicture;
  final String accountType;
  final bool isLoading;

  MyProfileState({
    this.username = "",
    this.profilePicture,
    this.accountType = "normal",
    this.isLoading = true,
  });

  MyProfileState copyWith({
    String? username,
    String? profilePicture,
    String? accountType,
    bool? isLoading,
  }) => MyProfileState(
    username: username ?? this.username,
    profilePicture: profilePicture ?? this.profilePicture,
    accountType: accountType ?? this.accountType,
    isLoading: isLoading ?? this.isLoading,
  );
}

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() : super(MyProfileState());

  final UserRepo _repo = UserRepo.getInstance();

  Future<void> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('logged_username') ?? "User Name";
    emit(state.copyWith(username: username, isLoading: false));

    await loadProfileData();
  }

  Future<void> updateUsername(String newUsername) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('logged_username', newUsername);
    emit(state.copyWith(username: newUsername));
  }

  Future<void> loadProfileData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final username = prefs.getString('logged_username');

      if (username == null || username.isEmpty) return;

      final user = await _repo.getUserByUsername(username);

      if (user != null) {
        emit(
          state.copyWith(
            profilePicture: user.profilePicture,
            accountType: user.userType,
          ),
        );
      }
    } catch (e) {
      print("Error loading profile data: $e");
    }
  }

  Future<void> updateProfilePicture(String? newPicturePath) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final username = prefs.getString('logged_username');

      if (username == null) return;

      final success = await _repo.updateProfilePicture(
        username,
        newPicturePath,
      );

      if (success) {
        emit(state.copyWith(profilePicture: newPicturePath));
      }
    } catch (e) {
      print("Error updating profile picture: $e");
    }
  }

  String getAccountTypeDisplay() {
    switch (state.accountType.toLowerCase()) {
      case 'company':
        return 'Company Account';
      case 'freelancer':
        return 'Freelancer Account';
      case 'normal':
        return 'Normal Account';
      default:
        return 'User Account';
    }
  }
}

