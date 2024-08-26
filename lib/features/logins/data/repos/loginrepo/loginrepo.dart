import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:starx/core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, User?>> logInWithEmailAndPassword(
      String email, String password);
}
