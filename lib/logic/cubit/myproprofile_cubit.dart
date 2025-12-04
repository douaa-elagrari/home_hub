// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // State class
// class MyProProfileState {
//   final String username;
//   MyProProfileState({required this.username});
// }

// // Cubit class
// class MyProfileCubit extends Cubit<MyProProfileState> {
//   MyProfileCubit() : super(MyProProfileState(username: "User Name")) {
//     loadUsername();
//   }

//   // Load username from SharedPreferences
//   Future<void> loadUsername() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedUsername = prefs.getString('logged_username') ?? "User Name";
//     emit(MyProProfileState(username: savedUsername)); // emit new state
//   }
// }
