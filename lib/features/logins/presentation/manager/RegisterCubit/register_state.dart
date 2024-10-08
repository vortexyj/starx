part of 'register_cubit.dart';

sealed class RegisterState {
  get fetchRegisterPage => null;
}

final class RegisterInitialState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {}

final class RegisterFailureState extends RegisterState {
  final String err;

  RegisterFailureState(this.err);
}
