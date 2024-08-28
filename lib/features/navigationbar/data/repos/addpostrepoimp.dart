import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:starx/core/errors/failure.dart';
import 'package:starx/core/errors/loginfailureserror.dart';
import 'package:starx/features/addpost/data/repos/addpostrepo.dart';

class Addpostrepoimp extends Addpostrepo {
  final ImagePicker _picker = ImagePicker();
  File? image;

  @override
  Future<Either<Failure, dynamic>> addPhoto() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      image = File(pickedFile!.path);
      final path = 'images/${pickedFile.name}';

      final ref = FirebaseStorage.instance.ref().child(path);
      UploadTask uploadTask = ref.putFile(image!);
      final snapshot = await uploadTask.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();

      return right(urlDownload);
    } on PlatformException catch (e) {
      return left(LoginFailures(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, String>> sendToStorageAndGetLink() async {
  //   try {
  //     // Await the result from AddPhoto
  //     final photoResult = await addPhoto();

  //     // Handle the Either type
  //     return photoResult.fold(
  //       (failure) => left(failure),
  //       (file) async {

  //       },
  //     );
  //   } on FirebaseException catch (e) {
  //     print("Firebase error is : ${e.toString()}");
  //     return left(LoginFailures(e.toString()));
  //   } catch (e) {
  //     print("Unknown error is : ${e.toString()}");
  //     return left(LoginFailures(e.toString()));
  //   }
  // }
}
