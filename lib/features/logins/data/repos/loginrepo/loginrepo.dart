import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  Future<Either<String, User?>> logInWithEmailAndPassword(
      String email, String password);
  Future<void> logOut();
  Future<User?> getCurrentUser();
}
