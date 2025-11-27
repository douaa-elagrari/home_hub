import 'package:flutter_bloc/flutter_bloc.dart';

class SignupState {
  final String fullName;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final bool submitted;
  final String error;

  SignupState({
    this.fullName = '',
    this.phone = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.submitted = false,
    this.error = '',
  });

  bool get isValid {
    return fullName.isNotEmpty &&
        phone.isNotEmpty &&
        password.isNotEmpty &&
        password == confirmPassword;
  }

  SignupState copyWith({
    String? fullName,
    String? phone,
    String? email,
    String? password,
    String? confirmPassword,
    bool? submitted,
    String? error,
  }) {
    return SignupState(
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      submitted: submitted ?? this.submitted,
      error: error ?? this.error,
    );
  }
}

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState());

  void fullNameChanged(String value) => emit(state.copyWith(fullName: value));
  void phoneChanged(String value) => emit(state.copyWith(phone: value));
  void emailChanged(String value) => emit(state.copyWith(email: value));
  void passwordChanged(String value) => emit(state.copyWith(password: value));
  void confirmPasswordChanged(String value) =>
      emit(state.copyWith(confirmPassword: value));

  void submit() {
    if (state.isValid) {
      emit(state.copyWith(submitted: true, error: ''));
    } else {
      emit(state.copyWith(error: 'Please fill all required fields correctly.'));
    }
  }
}
