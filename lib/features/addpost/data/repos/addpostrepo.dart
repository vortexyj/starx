import 'package:dartz/dartz.dart';
import 'package:starx/core/errors/failure.dart';

abstract class Addpostrepo {
  Future<Either<Failure, dynamic>> addPhoto(
      int comments, int likes, int shares);
  // Future<Either<Failure, String>> sendToStorageAndGetLink();
}
