import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/normaluser.dart';
import '../../../data/repositories/user_db_repo.dart';
import '../../../data/repositories/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api/api_service.dart';

class SignupState {
  final String email;
  final String username;
  final String password;
  final String confirmPassword;
  final bool submitted;
  final bool codeSent;
  final String error;

  SignupState({
    this.email = '',
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.submitted = false,
    this.codeSent = false,
    this.error = '',
  });

  bool get isValid =>
      email.trim().isNotEmpty &&
      username.trim().isNotEmpty &&
      password.isNotEmpty &&
      password == confirmPassword;

  SignupState copyWith({
    String? email,
    String? username,
    String? password,
    String? confirmPassword,
    bool? submitted,
    bool? codeSent,
    String? error,
  }) => SignupState(
    email: email ?? this.email,
    username: username ?? this.username,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    submitted: submitted ?? this.submitted,
    codeSent: codeSent ?? this.codeSent,
    error: error ?? this.error,
  );
}

class SignupCubit extends Cubit<SignupState> {
  final ApiService apiService;
  final UserDBRepo _repo = UserRepo.getInstance() as UserDBRepo;

  SignupCubit({required String apiBaseUrl})
    : apiService = ApiService(baseUrl: apiBaseUrl),
      super(SignupState());

  void emailChanged(String v) => emit(
    state.copyWith(
      email: v.trim(),
      error: '',
      submitted: false,
      codeSent: false,
    ),
  );

  void usernameChanged(String v) => emit(
    state.copyWith(
      username: v.trim(),
      error: '',
      submitted: false,
      codeSent: false,
    ),
  );

  void passwordChanged(String v) => emit(
    state.copyWith(password: v, error: '', submitted: false, codeSent: false),
  );

  void confirmPasswordChanged(String v) => emit(
    state.copyWith(
      confirmPassword: v,
      error: '',
      submitted: false,
      codeSent: false,
    ),
  );

  Future<bool> submit() async {
    if (!state.isValid) {
      emit(state.copyWith(error: "Please fill all fields correctly."));
      return false;
    }

    final exists = await _repo.usernameExists(state.username);
    if (exists) {
      emit(state.copyWith(error: "Username already exists."));
      return false;
    }

    try {
      await apiService.sendCode(state.email);
      emit(state.copyWith(codeSent: true, error: ''));
      return true;
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
      return false;
    }
  }

  Future<bool> storeinformations() async {
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
      emit(state.copyWith(error: "Signup failed. Try again."));
      return false;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('logged_username', user.username);
    await prefs.setString('user_type', user.userType);

    emit(state.copyWith(submitted: true, error: ""));
    return true;
  }

  Future<bool> verifyCode(String code) async {
    try {
      await apiService.verifyCode(state.email, code);
      return await storeinformations();
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
      return false;
    }
  }
}

