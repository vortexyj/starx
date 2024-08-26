import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:starx/core/errors/failure.dart';

abstract class Addpostrepo {
  Future<Either<Failure, File?>> AddPhoto();
  Future<Either<Failure, String?>> SendToStorageAndGetLink();
}
