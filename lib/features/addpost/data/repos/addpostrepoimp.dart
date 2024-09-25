import 'dart:io';
import 'dart:math';
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
import 'dart:math';

import 'package:starx/features/logins/data/model/usermodel.dart';

class Addpostrepoimp extends Addpostrepo {
  final ImagePicker _picker = ImagePicker();
  User? user = FirebaseAuth.instance.currentUser;
  List<int> documentNumber = [];
  int maxNumber = 0;
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

      final DocumentSnapshot<Map<String, dynamic>> snapshooot =
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(user!.uid)
              .get();

      UserModel userModel = UserModel.fromMap(snapshooot.data()!);

      PostModel newUser = PostModel(
        comments: comments,
        likes: likes,
        shares: shares,
        image: urlDownload,
        uid: currentUser!.uid,
        profileImage: userModel.photo,
        userName: userModel.username,
      );

      QuerySnapshot snapshoot = await FirebaseFirestore.instance
          .collection('Posts')
          .doc(user!.uid)
          .collection('Numbers')
          .get();
      int numberNext = snapshoot.docs.length;

      // // Loop through the documents
      // for (var doc in snapshoot.docs) {
      //   // Check if the document has any data
      //   if (doc.exists && doc.data() is Map) {
      //     // Convert the document data to a Map
      //     Map<String, dynamic> docData = doc.data() as Map<String, dynamic>;

      //     // Check if the document data contains the 'numberField' key
      //     if (docData.containsKey('numberField')) {
      //       var numberField = docData['numberField'];

      //       // Convert the field to a string and then parse it as an integer
      //       int? number = int.tryParse(numberField.toString());

      //       // Add to the list if the conversion was successful
      //       if (number != null) {
      //         documentNumber.add(number);
      //       }
      //     } else {
      //       print(
      //           'Document ${doc.id} does not contain the "numberField" field.');
      //     }
      //   } else {
      //     print('Document ${doc.id} is empty or not structured as expected.');
      //   }
      // }

      // Get the maximum number in the list, if the list is not empty

      DocumentReference usersRef = FirebaseFirestore.instance
          .collection('Posts')
          .doc(currentUser.uid)
          .collection('Numbers')
          .doc('${numberNext + 1}');
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
