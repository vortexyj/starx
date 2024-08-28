import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starx/features/addpost/data/repos/addpostrepoimp.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());

  Future<void> fetchAddPhoto() async {
    emit(AddPostLoading());
    var result = await Addpostrepoimp().addPhoto();
    result.fold(
      (failure) {
        emit(AddPostFailure(failure.errMessage));
      },
      (downloadUrl) {
        emit(AddPostSuccess(downloadUrl));
      },
    );
  }

  // Future<void> fetchUploadAndGetlink() async {
  //   emit(AddPostLoading());
  //   var result = await Addpostrepoimp().sendToStorageAndGetLink();
  //   result.fold(
  //     (failure) {
  //       emit(AddPostFailure(failure.errMessage));
  //     },
  //     (downloadUrl) {
  //       emit(AddPostSuccess());
  //     },
  //   );
  // }
}
