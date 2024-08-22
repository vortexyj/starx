import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepo {
  Future<Either<String, User?>> registerWithEmailAndPassword(
      String email, String password);
}
