// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../data/models/Baseuser.dart';
// import '../../../data/repositories/user_db_repo.dart';
// import '../../../data/repositories/user_repo.dart';

// class SigninState {
//   final String username;
//   final String password;
//   final bool isLoading;
//   final bool success;
//   final String error;
//   final UserModel? user;

//   SigninState({
//     this.username = '',
//     this.password = '',
//     this.isLoading = false,
//     this.success = false,
//     this.error = '',
//     this.user,
//   });

//   SigninState copyWith({
//     String? username,
//     String? password,
//     bool? isLoading,
//     bool? success,
//     String? error,
//     UserModel? user,
//   }) => SigninState(
//     username: username ?? this.username,
//     password: password ?? this.password,
//     isLoading: isLoading ?? this.isLoading,
//     success: success ?? this.success,
//     error: error ?? this.error,
//     user: user ?? this.user,
//   );
// }

// class SigninCubit extends Cubit<SigninState> {
//   SigninCubit() : super(SigninState());

//   final UserDBRepo _repo = UserRepo.getInstance() as UserDBRepo;

//   void usernameChanged(String v) =>
//       emit(state.copyWith(username: v, error: '', success: false));

//   void passwordChanged(String v) =>
//       emit(state.copyWith(password: v, error: '', success: false));

//   Future<void> signIn(String username, String password) async {
//     emit(state.copyWith(isLoading: true, error: ''));

//     try {
//       final user = await _repo.login(username, password);

//       if (user == null) {
//         emit(
//           state.copyWith(
//             error: "Invalid username or password",
//             isLoading: false,
//           ),
//         );
//         return;
//       }

//       emit(
//         state.copyWith(user: user, success: true, isLoading: false, error: ""),
//       );
//     } catch (e) {
//       print("Sign in error: $e");
//       emit(
//         state.copyWith(
//           error: "An error occurred. Please try again.",
//           isLoading: false,
//         ),
//       );
//     }
//   }
// }

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../data/models/Baseuser.dart';
// import '../../../data/repositories/user_db_repo.dart';
// import '../../../data/repositories/user_repo.dart';

// class SigninState {
//   final String username;
//   final String password;
//   final bool isLoading;
//   final bool success;
//   final String error;
//   final UserModel? user;

//   SigninState({
//     this.username = '',
//     this.password = '',
//     this.isLoading = false,
//     this.success = false,
//     this.error = '',
//     this.user,
//   });

//   SigninState copyWith({
//     String? username,
//     String? password,
//     bool? isLoading,
//     bool? success,
//     String? error,
//     UserModel? user,
//   }) => SigninState(
//     username: username ?? this.username,
//     password: password ?? this.password,
//     isLoading: isLoading ?? this.isLoading,
//     success: success ?? this.success,
//     error: error ?? this.error,
//     user: user ?? this.user,
//   );
// }

// class SigninCubit extends Cubit<SigninState> {
//   SigninCubit() : super(SigninState());

//   final UserDBRepo _repo = UserRepo.getInstance() as UserDBRepo;

//   void usernameChanged(String v) =>
//       emit(state.copyWith(username: v, error: '', success: false));

//   void passwordChanged(String v) =>
//       emit(state.copyWith(password: v, error: '', success: false));

//   Future<void> signIn(String usernameOrEmail, String password) async {
//     emit(state.copyWith(isLoading: true, error: ''));

//     if (usernameOrEmail.isEmpty || password.isEmpty) {
//       emit(
//         state.copyWith(
//           isLoading: false,
//           error: "Please enter username and password.",
//         ),
//       );
//       return;
//     }

//     // Check if user exists
//     final user = await _repo.login(usernameOrEmail, password);
//     if (user == null) {
//       // Either username/email does not exist OR password is wrong
//       emit(
//         state.copyWith(
//           isLoading: false,
//           error: "Invalid username/email or password. Try again.",
//         ),
//       );
//       return;
//     }

//     // Save logged-in username
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('logged_username', user.username);

//     emit(
//       state.copyWith(user: user, success: true, isLoading: false, error: ""),
//     );
//   }
// }

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../data/models/Baseuser.dart';
// import '../../../data/repositories/user_db_repo.dart';
// import '../../../data/repositories/user_repo.dart';

// class SigninState {
//   final String username;
//   final String password;
//   final bool isLoading;
//   final bool success;
//   final String error;
//   final UserModel? user;

//   SigninState({
//     this.username = '',
//     this.password = '',
//     this.isLoading = false,
//     this.success = false,
//     this.error = '',
//     this.user,
//   });

//   SigninState copyWith({
//     String? username,
//     String? password,
//     bool? isLoading,
//     bool? success,
//     String? error,
//     UserModel? user,
//   }) => SigninState(
//     username: username ?? this.username,
//     password: password ?? this.password,
//     isLoading: isLoading ?? this.isLoading,
//     success: success ?? this.success,
//     error: error ?? this.error,
//     user: user ?? this.user,
//   );
// }

// class SigninCubit extends Cubit<SigninState> {
//   SigninCubit() : super(SigninState());

//   final UserDBRepo _repo = UserRepo.getInstance() as UserDBRepo;

//   void usernameChanged(String v) =>
//       emit(state.copyWith(username: v, error: '', success: false));

//   void passwordChanged(String v) =>
//       emit(state.copyWith(password: v, error: '', success: false));

//   Future<void> signIn(String usernameOrEmail, String password) async {
//     emit(state.copyWith(isLoading: true, error: ''));

//     if (usernameOrEmail.isEmpty || password.isEmpty) {
//       emit(
//         state.copyWith(
//           isLoading: false,
//           error: "Please enter username and password.",
//         ),
//       );
//       return;
//     }

//     final user = await _repo.login(usernameOrEmail, password);
//     if (user == null) {
//       emit(
//         state.copyWith(
//           isLoading: false,
//           error: "Invalid username/email or password. Try again.",
//         ),
//       );
//       return;
//     }

//     // Save username and ID securely
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('logged_username', user.username);
//     await prefs.setString('logged_user_id', user.id.toString());

//     emit(
//       state.copyWith(user: user, success: true, isLoading: false, error: ""),
//     );
//   }
// }

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../data/models/Baseuser.dart';
// import '../../../data/repositories/user_db_repo.dart';
// import '../../../data/repositories/user_repo.dart';

// class SigninState {
//   final String username;
//   final String password;
//   final bool isLoading;
//   final bool success;
//   final String error;
//   final UserModel? user;

//   SigninState({
//     this.username = '',
//     this.password = '',
//     this.isLoading = false,
//     this.success = false,
//     this.error = '',
//     this.user,
//   });

//   SigninState copyWith({
//     String? username,
//     String? password,
//     bool? isLoading,
//     bool? success,
//     String? error,
//     UserModel? user,
//   }) => SigninState(
//     username: username ?? this.username,
//     password: password ?? this.password,
//     isLoading: isLoading ?? this.isLoading,
//     success: success ?? this.success,
//     error: error ?? this.error,
//     user: user ?? this.user,
//   );
// }

// class SigninCubit extends Cubit<SigninState> {
//   SigninCubit() : super(SigninState());

//   final UserDBRepo _repo = UserRepo.getInstance() as UserDBRepo;

//   void usernameChanged(String v) =>
//       emit(state.copyWith(username: v, error: '', success: false));

//   void passwordChanged(String v) =>
//       emit(state.copyWith(password: v, error: '', success: false));

//   Future<void> signIn(String usernameOrEmail, String password) async {
//     emit(state.copyWith(isLoading: true, error: ''));

//     if (usernameOrEmail.isEmpty || password.isEmpty) {
//       emit(
//         state.copyWith(
//           isLoading: false,
//           error: "Please enter username and password.",
//         ),
//       );
//       return;
//     }

//     // Check if user exists
//     final user = await _repo.login(usernameOrEmail, password);
//     if (user == null) {
//       emit(
//         state.copyWith(
//           isLoading: false,
//           error: "Invalid username/email or password. Try again.",
//         ),
//       );
//       return;
//     }

//     // Clear previous login first to prevent bypass
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear(); // important! removes all old keys
//     await prefs.setString('logged_username', user.username);
//     await prefs.setInt('logged_user_id', user.id ?? 0);

//     emit(
//       state.copyWith(user: user, success: true, isLoading: false, error: ""),
//     );
//   }

//   Future<void> logout() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear(); // clear all stored login info
//     emit(SigninState());
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/Baseuser.dart';
import '../../../data/repositories/user_db_repo.dart';
import '../../../data/repositories/user_repo.dart';

class SigninState {
  final String username;
  final String password;
  final bool isLoading;
  final bool success;
  final String error;
  final UserModel? user;

  SigninState({
    this.username = '',
    this.password = '',
    this.isLoading = false,
    this.success = false,
    this.error = '',
    this.user,
  });

  SigninState copyWith({
    String? username,
    String? password,
    bool? isLoading,
    bool? success,
    String? error,
    UserModel? user,
  }) {
    return SigninState(
      username: username ?? this.username,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      success: success ?? this.success,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }
}

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninState());

  final UserDBRepo _repo = UserRepo.getInstance() as UserDBRepo;

  void usernameChanged(String v) {
    emit(state.copyWith(username: v, error: '', success: false));
  }

  void passwordChanged(String v) {
    emit(state.copyWith(password: v, error: '', success: false));
  }


  void resetSuccess() {
    emit(state.copyWith(success: false));
  }

  Future<void> signIn(String usernameOrEmail, String password) async {
    emit(state.copyWith(isLoading: true, error: '', success: false));

 
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    if (usernameOrEmail.isEmpty || password.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          error: "Please enter username and password.",
          success: false,
        ),
      );
      return;
    }

   
    final user = await _repo.login(usernameOrEmail, password);

    if (user == null) {
      emit(
        state.copyWith(
          isLoading: false,
          error: "Invalid username/email or password. Try again.",
          success: false,
        ),
      );
      return;
    }

    await prefs.setString('logged_username', user.username);
    await prefs.setInt('logged_user_id', user.id ?? 0);

    emit(
      state.copyWith(user: user, success: true, isLoading: false, error: ""),
    );
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    emit(SigninState());
  }
}
