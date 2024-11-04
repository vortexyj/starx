import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starx/features/logins/data/model/usermodel.dart';
import 'package:starx/features/profile/data/repos/profilerepoimp.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> fetchProfileData() async {
    emit(ProfileLoading());
    var result = await ProfileRepoImp().loadProfile();
    result.fold(
      (failure) {
        emit(ProfileFailure(failure.errMessage));
      },
      (downloadUrl) {
        emit(ProfileSuccess(downloadUrl));
      },
    );
  }
}
