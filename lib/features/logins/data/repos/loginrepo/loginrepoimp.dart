import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:starx/core/errors/failure.dart';
import 'package:starx/core/errors/loginfailureserror.dart';
import 'package:starx/features/logins/data/repos/loginrepo/loginrepo.dart';

class LoginRepoImp extends LoginRepo {
  LoginRepoImp();

  @override
  Future<Either<Failure, User?>> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(user.user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(LoginFailures.fromFireBaseAuth(e));
      } else {
        return left(LoginFailures(e.toString()));
      }
    }
  }
}
