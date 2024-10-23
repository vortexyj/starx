import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starx/features/feed/data/model/postmodel.dart';
import 'package:starx/features/feed/data/repos/createpostrepoimp.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInitial());
  Future<void> fetchCreatePost() async {
    emit(CreatePostLoading());
    var result = await CreatePostRepoImp().loadPost();
    result.fold((err) {
      emit(CreatePostFailure(err.toString()));
    }, (data) {
      emit(CreatePostSuccess(data));
    });
  }
}
