import 'package:firebase_auth/firebase_auth.dart';
import 'package:starx/core/errors/failure.dart';

class RegisterFailures extends Failure {
  RegisterFailures(super.errMessage);

  factory RegisterFailures.fromFireBaseAuth(FirebaseAuthException err) {
    switch (err.code) {
      case "auth/email-already-exists":
        return RegisterFailures("Email already used. Go to login page!.");
      case "auth/claims-too-large":
        return RegisterFailures("Claims to large!.");
      case "auth/id-token-expired":
        return RegisterFailures("Token expired!, server error.");
      case "auth/id-token-revoked":
        return RegisterFailures("The Firebase ID token has been revoked.");
      case "auth/invalid-email":
        return RegisterFailures(
            "The provided value for the email user property is invalid. It must be a string email address..");
      case "auth/invalid-password":
        return RegisterFailures("It must be at least six characters.");
      case "weak-password":
        return RegisterFailures("Weak password.");

      default:
        return RegisterFailures('Opps There was an Error, Please try again');
    }
  }
}
  // factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
  //   if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
  //     return ServerFailure(response['error']['message']);
  //   } else if (statusCode == 404) {
  //     return ServerFailure('Your request not found, Please try later!');
  //   } else if (statusCode == 500) {
  //     return ServerFailure('Internal Server error, Please try later');
  //   } else {
  //     return ServerFailure('Opps There was an Error, Please try again');
  //   }
  // }

