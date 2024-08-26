import 'package:firebase_auth/firebase_auth.dart';
import 'package:starx/core/errors/failure.dart';

class LoginFailures extends Failure {
  LoginFailures(super.errMessage);

  factory LoginFailures.fromFireBaseAuth(FirebaseAuthException err) {
    switch (err.code) {
      case 'user-not-found':
        return LoginFailures("User not found.");
      case 'wrong-password':
        return LoginFailures("Wrong password.");

      default:
        return LoginFailures('Opps There was an Error, Please try again');
    }
  }
}
