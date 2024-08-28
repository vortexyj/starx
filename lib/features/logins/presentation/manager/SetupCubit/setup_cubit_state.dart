part of 'setup_cubit_cubit.dart';

@immutable
sealed class SetupCubitState {}

final class SetupCubitInitial extends SetupCubitState {}

final class SetupCubitLoading extends SetupCubitState {}

final class SetupCubitSuccess extends SetupCubitState {}

final class SetupCubitFailure extends SetupCubitState {
  final String failure;

  SetupCubitFailure(this.failure);
}
