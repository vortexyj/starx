import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:starx/core/errors/failure.dart';
import 'package:starx/core/errors/loginfailureserror.dart';
import 'package:starx/features/navigationbar/data/repos/addpostrepo.dart';

class Addpostrepoimp extends Addpostrepo {
  final ImagePicker _picker = ImagePicker();
  File? image;
  @override
  Future<Either<Failure, File?>> AddPhoto() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      image = pickedFile != null ? File(pickedFile.path) : null;
      return right(image);
    } on PlatformException catch (e) {
      // TODO
      print("error is : ${e.toString()}");
      return left(LoginFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> SendToStorageAndGetLink() {
    //comment
    // TODO: implement SendToStorageAndGetLink
    throw UnimplementedError();
  }
}
