import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:starx/core/errors/failure.dart';

class RandomError extends Failure {
  RandomError(super.errMessage);
  factory RandomError.fromFireBaseRandom(FirebaseException err) {
    return RandomError(err.toString());
  }
}
