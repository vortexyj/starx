import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:starx/core/errors/failure.dart';
import 'package:starx/core/errors/registerfailureserror.dart';
import 'package:starx/features/logins/data/repos/registerrepo/registerrepo.dart';

class RegisterRepoImp extends RegisterRepo {
  @override
  Future<Either<Failure, User?>> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(user.user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(RegisterFailures.fromFireBaseAuth(e));
      } else {
        return left(RegisterFailures(e.toString()));
      }
    }
  }
}
