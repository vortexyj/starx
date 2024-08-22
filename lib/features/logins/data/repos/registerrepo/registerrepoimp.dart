import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:starx/features/logins/data/repos/loginrepo/loginrepo.dart';
import 'package:starx/features/logins/data/repos/registerrepo/registerrepo.dart';

class RegisterRepoImp extends RegisterRepo {
  @override
  final FirebaseAuth _firebaseAuth;

  RegisterRepoImp(this._firebaseAuth);

  @override
  Future<Either<String, User?>> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(user.user);
    } on FirebaseAuth catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
