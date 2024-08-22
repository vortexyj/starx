part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {
  final User? user;

  RegisterSuccessState(this.user);
}

final class RegisterFailureState extends RegisterState {
  final String err;

  RegisterFailureState(this.err);
}
