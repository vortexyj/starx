import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:starx/features/logins/data/repos/registerrepo/registerrepo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitialState());
  final RegisterRepo registerRepo;
  Future<void> fetchRegisterPage(String email, String password) async {
    emit(RegisterLoadingState());
    var result =
        await registerRepo.registerWithEmailAndPassword(email, password);
    result.fold((err) {
      emit(RegisterFailureState(err));
    }, (user) {
      emit(RegisterSuccessState(user));
    });
  }
}
