import 'package:dartz/dartz.dart';
import 'package:starx/core/errors/failure.dart';
import 'package:starx/features/feed/data/model/postmodel.dart';

abstract class CreatPostRepo {
  Future<Either<Failure, PostModel>> loadPost();
  // Future<Either<Failure, String>> sendToStorageAndGetLink();
}
