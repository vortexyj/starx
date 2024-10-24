part of 'create_post_cubit.dart';

sealed class CreatePostState {}

final class CreatePostInitial extends CreatePostState {}

final class CreatePostLoading extends CreatePostState {}

final class CreatePostSuccess extends CreatePostState {
  final List<PostModel> data;

  CreatePostSuccess(this.data);
}

final class CreatePostFailure extends CreatePostState {
  final String errMessage;

  CreatePostFailure(this.errMessage);
}
