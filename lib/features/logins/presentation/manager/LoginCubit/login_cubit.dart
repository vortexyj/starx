import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:starx/features/logins/data/repos/loginrepo/loginrepo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitialState());

  final LoginRepo loginRepo;
  Future<void> fetchLoginPage(String email, String password) async {
    emit(LoginLoadingState());
    var result = await loginRepo.logInWithEmailAndPassword(email, password);
    result.fold((err) {
      emit(LoginFailureState(err));
    }, (user) {
      emit(LoginSuccessState(user));
    });
  }
}