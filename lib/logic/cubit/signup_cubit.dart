import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homehub/data/databases/db_helper.dart';

class SignupState {
  final String fullName;
  final String username;
  final String password;
  final String confirmPassword;
  final bool submitted;
  final String error;

  SignupState({
    this.fullName = '',
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.submitted = false,
    this.error = '',
  });

  bool get isValid =>
      fullName.isNotEmpty &&
      username.isNotEmpty &&
      password.isNotEmpty &&
      password == confirmPassword;

  SignupState copyWith({
    String? fullName,
    String? username,
    String? password,
    String? confirmPassword,
    bool? submitted,
    String? error,
  }) => SignupState(
    fullName: fullName ?? this.fullName,
    username: username ?? this.username,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    submitted: submitted ?? this.submitted,
    error: error ?? this.error,
  );
}

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState());

  void fullNameChanged(String value) => emit(state.copyWith(fullName: value));
  void usernameChanged(String value) => emit(state.copyWith(username: value));
  void passwordChanged(String value) => emit(state.copyWith(password: value));
  void confirmPasswordChanged(String value) =>
      emit(state.copyWith(confirmPassword: value));

  Future<void> submit() async {
    if (!state.isValid) {
      emit(state.copyWith(error: 'Please fill all fields correctly.'));
      return;
    }

    final exists = await DBHelper().usernameExists(state.username);
    if (exists) {
      emit(state.copyWith(error: 'Username already exists.'));
      return;
    }

    try {
      await DBHelper().insertUser({
        'fullName': state.fullName,
        'username': state.username,
        'password': state.password,
      });
      emit(state.copyWith(submitted: true, error: ''));
    } catch (e) {
      emit(state.copyWith(error: 'Signup failed.'));
    }
  }
}
