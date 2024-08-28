part of 'add_post_cubit.dart';

sealed class AddPostState {}

final class AddPostInitial extends AddPostState {}

final class AddPostLoading extends AddPostState {}

final class AddPostSuccess extends AddPostState {
  final dynamic urlDownload;

  AddPostSuccess(this.urlDownload);
}

final class AddPostFailure extends AddPostState {
  final String errMessage;

  AddPostFailure(this.errMessage);
}
