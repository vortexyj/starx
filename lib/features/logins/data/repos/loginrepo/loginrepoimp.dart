import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:starx/features/logins/data/repos/loginrepo/loginrepo.dart';

class LoginRepoImp extends LoginRepo {
  final FirebaseAuth _firebaseAuth;

  LoginRepoImp(this._firebaseAuth);

  @override
  Future<Either<String, User?>> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(user.user);
    } on FirebaseAuthException catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}