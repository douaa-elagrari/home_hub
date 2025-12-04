import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfileState {
  final String username;

  MyProfileState({this.username = ""});

  MyProfileState copyWith({String? username}) =>
      MyProfileState(username: username ?? this.username);
}

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() : super(MyProfileState());

  // Load username from SharedPreferences
  Future<void> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('logged_username') ?? "User Name";
    emit(state.copyWith(username: username));
  }

  // Update username in SharedPreferences
  Future<void> updateUsername(String newUsername) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('logged_username', newUsername);
    emit(state.copyWith(username: newUsername));
  }
}
