import 'package:firebase_auth/firebase_auth.dart';
import 'package:starx/core/errors/failure.dart';

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromFireBaseAuth(FirebaseAuthException err) {
    switch (err.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "email-already-in-use":
      case "account-exists-with-different-credential":
      case "auth/email-already-exists":
        return ServerFailure("Email already used. Go to login page.");

      default:
        return ServerFailure('Opps There was an Error, Please try again');
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
}
