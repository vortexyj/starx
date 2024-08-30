// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:starx/features/logins/data/repos/setupaccrepo/setupaccrepoimp.dart';

part 'setup_cubit_state.dart';

class SetupCubitCubit extends Cubit<SetupCubitState> {
  SetupCubitCubit() : super(SetupCubitInitial());
  Future<void> fetchSetupPage(String photoURL, String userName, String account,
      int following, int followers, int posts) async {
    emit(SetupCubitLoading());

    try {
      await Setupaccrepoimp().setupUserData(
          photoURL, userName, account, followers, following, posts);
      emit(SetupCubitSuccess());
    } on Exception catch (e) {
      emit(SetupCubitFailure(e.toString()));
    }
  }
}
