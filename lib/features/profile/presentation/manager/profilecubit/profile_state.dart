part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserModel userModel;

  ProfileSuccess(this.userModel);
}

final class ProfileFailure extends ProfileState {
  final String errMessage;

  ProfileFailure(this.errMessage);
}
