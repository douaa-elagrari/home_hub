import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/companyuser.dart';
import '../../../data/models/freelanceruser.dart';
import '../../../data/repositories/user_db_repo.dart';
import '../../../data/repositories/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupProState {
  final String type; // 'Individual' or 'Company'
  final String name;
  final String companyName;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final String vatNumber;
  final String location;
  final String description;
  final bool submitted;
  final bool isSubmitting;
  final String error;

  SignupProState({
    this.type = 'Individual',
    this.name = '',
    this.companyName = '',
    this.phone = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.vatNumber = '',
    this.location = '',
    this.description = '',
    this.submitted = false,
    this.isSubmitting = false,
    this.error = '',
  });

  SignupProState copyWith({
    String? type,
    String? name,
    String? companyName,
    String? phone,
    String? email,
    String? password,
    String? confirmPassword,
    String? vatNumber,
    String? location,
    String? description,
    bool? submitted,
    bool? isSubmitting,
    String? error,
  }) => SignupProState(
    type: type ?? this.type,
    name: name ?? this.name,
    companyName: companyName ?? this.companyName,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    vatNumber: vatNumber ?? this.vatNumber,
    location: location ?? this.location,
    description: description ?? this.description,
    submitted: submitted ?? this.submitted,
    isSubmitting: isSubmitting ?? this.isSubmitting,
    error: error ?? this.error,
  );
}

class SignupProCubit extends Cubit<SignupProState> {
  SignupProCubit() : super(SignupProState());

  final UserDBRepo _repo = UserRepo.getInstance() as UserDBRepo;

  void changeType(String newType) {
    emit(state.copyWith(type: newType, error: ''));
  }

  void nameChanged(String v) =>
      emit(state.copyWith(name: v, error: '', submitted: false));
  void companyNameChanged(String v) =>
      emit(state.copyWith(companyName: v, error: '', submitted: false));
  void phoneChanged(String v) =>
      emit(state.copyWith(phone: v, error: '', submitted: false));
  void emailChanged(String v) =>
      emit(state.copyWith(email: v, error: '', submitted: false));
  void passwordChanged(String v) =>
      emit(state.copyWith(password: v, error: '', submitted: false));
  void confirmPasswordChanged(String v) =>
      emit(state.copyWith(confirmPassword: v, error: '', submitted: false));
  void vatNumberChanged(String v) =>
      emit(state.copyWith(vatNumber: v, error: '', submitted: false));
  void locationChanged(String v) =>
      emit(state.copyWith(location: v, error: '', submitted: false));
  void descriptionChanged(String v) =>
      emit(state.copyWith(description: v, error: '', submitted: false));

  Future<void> submitForm({
    required String name,
    required String companyName,
    required String phone,
    required String email,
    required String password,
    required String vatNumber,
    String? location,
    String? description,
  }) async {
    emit(state.copyWith(isSubmitting: true, error: ''));

    try {
      final emailExists = await _repo.emailExists(email);
      if (emailExists) {
        emit(
          state.copyWith(error: "Email already exists.", isSubmitting: false),
        );
        return;
      }

      if (state.type == 'Company') {
        final user = CompanyUserModel(
          id: null,
          username: email.split('@')[0],
          email: email,
          password: password,
          companyName: companyName,
          phone: phone,
          vatNumber: vatNumber,
          location: location,
          description: description,
        );

        final success = await _repo.signup(user);
        if (!success) {
          emit(
            state.copyWith(
              error: "Signup failed. Try again.",
              isSubmitting: false,
            ),
          );
          return;
        }
        // Save username to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('logged_username', user.username);
      } else {
        final user = FreelancerUserModel(
          id: null,
          username: name,
          email: email,
          password: password,
          fullName: name,
          birthDate: "",
          address: "",
          phone: phone,
        );

        final success = await _repo.signup(user);
        if (!success) {
          emit(
            state.copyWith(
              error: "Signup failed. Try again.",
              isSubmitting: false,
            ),
          );
          return;
        }
        // Save username to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('logged_username', user.username);
      }

      emit(state.copyWith(submitted: true, isSubmitting: false, error: ""));
    } catch (e) {
      print("Signup error: $e");
      emit(
        state.copyWith(
          error: "An error occurred. Please try again.",
          isSubmitting: false,
        ),
      );
    }
  }

  void resetSubmitting() {
    emit(state.copyWith(isSubmitting: false));
  }
} 