import 'package:flutter_bloc/flutter_bloc.dart';
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
  }) => SigninState(
    username: username ?? this.username,
    password: password ?? this.password,
    isLoading: isLoading ?? this.isLoading,
    success: success ?? this.success,
    error: error ?? this.error,
    user: user ?? this.user,
  );
}

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninState());

  final UserDBRepo _repo = UserRepo.getInstance() as UserDBRepo;

  void usernameChanged(String v) =>
      emit(state.copyWith(username: v, error: '', success: false));

  void passwordChanged(String v) =>
      emit(state.copyWith(password: v, error: '', success: false));

  Future<void> signIn(String username, String password) async {
    emit(state.copyWith(isLoading: true, error: ''));

    try {
      final user = await _repo.login(username, password);

      if (user == null) {
        emit(
          state.copyWith(
            error: "Invalid username or password",
            isLoading: false,
          ),
        );
        return;
      }

      emit(
        state.copyWith(user: user, success: true, isLoading: false, error: ""),
      );
    } catch (e) {
      print("Sign in error: $e");
      emit(
        state.copyWith(
          error: "An error occurred. Please try again.",
          isLoading: false,
        ),
      );
    }
  }
}
