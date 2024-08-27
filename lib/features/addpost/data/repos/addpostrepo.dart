import 'package:dartz/dartz.dart';
import 'package:starx/core/errors/failure.dart';

abstract class Addpostrepo {
  Future<Either<Failure, dynamic>> addPhoto();
  // Future<Either<Failure, String>> sendToStorageAndGetLink();
}
