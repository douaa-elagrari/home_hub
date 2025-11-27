import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Define the state
class SignupProState extends Equatable {
  final String type; // Individual or Company
  final bool isSubmitting;

  const SignupProState({
    this.type = 'Individual',
    this.isSubmitting = false,
  });

  SignupProState copyWith({
    String? type,
    bool? isSubmitting,
  }) {
    return SignupProState(
      type: type ?? this.type,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object> get props => [type, isSubmitting];
}

// Define the Cubit
class SignupProCubit extends Cubit<SignupProState> {
  SignupProCubit() : super(const SignupProState());

  void changeType(String newType) {
    emit(state.copyWith(type: newType));
  }

  void submitForm() {
    emit(state.copyWith(isSubmitting: true));
    // Here you can add actual submission logic (API call)
  }

  void resetSubmitting() {
    emit(state.copyWith(isSubmitting: false));
  }
}
