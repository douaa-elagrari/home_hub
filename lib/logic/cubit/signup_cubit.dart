import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/normaluser.dart';
import '../../../data/repositories/user_db_repo.dart';
import '../../../data/repositories/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupState {
  final String email;
  final String username;
  final String password;
  final String confirmPassword;
  final bool submitted;
  final String error;

  SignupState({
    this.email = '',
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.submitted = false,
    this.error = '',
  });

  bool get isValid =>
      email.isNotEmpty &&
      username.isNotEmpty &&
      password.isNotEmpty &&
      password == confirmPassword;

  SignupState copyWith({
    String? email,
    String? username,
    String? password,
    String? confirmPassword,
    bool? submitted,
    String? error,
  }) => SignupState(
    email: email ?? this.email,
    username: username ?? this.username,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    submitted: submitted ?? this.submitted,
    error: error ?? this.error,
  );
}

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState());

  final UserDBRepo _repo = UserRepo.getInstance() as UserDBRepo;

  void emailChanged(String v) =>
      emit(state.copyWith(email: v, error: '', submitted: false));

  void usernameChanged(String v) =>
      emit(state.copyWith(username: v, error: '', submitted: false));

  void passwordChanged(String v) =>
      emit(state.copyWith(password: v, error: '', submitted: false));

  void confirmPasswordChanged(String v) =>
      emit(state.copyWith(confirmPassword: v, error: '', submitted: false));

  Future<void> submit() async {
    if (!state.isValid) {
      emit(state.copyWith(error: "Please fill all fields correctly."));
      return;
    }

    final exists = await _repo.usernameExists(state.username);
    if (exists) {
      emit(state.copyWith(error: "Username already exists."));
      return;
    }

    final user = NormalUserModel(
      id: null,
      username: state.username,
      email: state.email,
      password: state.password,
      fullName: "",
      birthDate: "",
      address: "",
    );

    final success = await _repo.signup(user);

    if (!success) {
      print("Signup failed");
      emit(state.copyWith(error: "Signup failed. Try again."));
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('logged_username', user.username);

    emit(state.copyWith(submitted: true, error: ""));
  }
}
