part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final User? user;

  LoginSuccessState(this.user);
}

final class LoginLoadingState extends LoginState {}

final class LoginFailureState extends LoginState {
  final String err;

  LoginFailureState(this.err);
}
