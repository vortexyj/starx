import 'package:dartz/dartz.dart';
import 'package:starx/core/errors/failure.dart';
import 'package:starx/features/logins/data/model/usermodel.dart';

abstract class Profilerepo {
  Future<Either<Failure, UserModel>> loadProfile();
  // Future<Either<Failure, String>> sendToStorageAndGetLink();
}
