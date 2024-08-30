import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:starx/core/errors/failure.dart';
import 'package:starx/core/errors/loginfailureserror.dart';
import 'package:starx/features/addpost/data/repos/addpostrepo.dart';
import 'package:starx/features/feed/data/model/postmodel.dart';

class Addpostrepoimp extends Addpostrepo {
  final ImagePicker _picker = ImagePicker();
  File? imagee;

  @override
  Future<Either<Failure, dynamic>> addPhoto(
      int comments, int likes, int shares) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      imagee = File(pickedFile!.path);
      final path = 'images/${pickedFile.name}';

      final ref = FirebaseStorage.instance.ref().child(path);
      UploadTask uploadTask = ref.putFile(imagee!);
      final snapshot = await uploadTask.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();

      PostModel newUser = PostModel(
          comments: comments,
          likes: likes,
          shares: shares,
          image: urlDownload,
          uid: currentUser!.uid);

      DocumentReference usersRef = FirebaseFirestore.instance
          .collection('Posts')
          .doc(currentUser!.uid)
          .collection('Numbers')
          .doc('2');
      try {
        await usersRef.set(newUser.toMap());
        // ignore: avoid_print
        print('User added successfully');
      } catch (e) {
        // ignore: avoid_print
        print('Failed to add user: $e');
      }
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
