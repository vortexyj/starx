import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:starx/core/errors/failure.dart';

abstract class RegisterRepo {
  Future<Either<Failure, User?>> registerWithEmailAndPassword(
      String email, String password);
}
