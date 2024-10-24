import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:starx/core/errors/failure.dart';
import 'package:starx/core/errors/loginfailureserror.dart';
import 'package:starx/core/utils/constants.dart';
import 'package:starx/features/addpost/data/repos/addpostrepo.dart';
import '../../../logins/data/model/usermodel.dart';

class Addpostrepoimp extends Addpostrepo {
  final ImagePicker _picker = ImagePicker();
  File? imagee;
  final FirebaseFirestore fireStoreRef = FirebaseFirestore.instance;
  final DatabaseReference postRef = FirebaseDatabase.instance.ref(AppValuesPost.kPost);

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

// 3. Get user data from Firestore
      final userSnapshot =
          await fireStoreRef.collection('Users').doc(currentUser!.uid).get();
      if (!userSnapshot.exists) {
        return left(LoginFailures('User not found'));
      }
      final userModel = UserModel.fromMap(userSnapshot.data()!);

        // 4.Get the last post number from realtimedb
      try {
        // Get the last number under the userUID from realtimedb
        DatabaseEvent event = await postRef
            .child(currentUser.uid)
            .orderByKey()
            .limitToLast(1)
            .once();

        if (event.snapshot.exists) {
          // Get the last number
          Map<dynamic, dynamic> data =
              event.snapshot.value as Map<dynamic, dynamic>;
          int lastKey = int.parse(data.keys.first); // E

          // Increment the number
          int newNumber = lastKey + 1;

          // 5. Create a new post in Realtime Database
          await postRef
              .child(currentUser.uid)
              .child((newNumber).toString())
              .set({
            'comments': comments,
            'date': DateTime.now().toString(), // Fix for DateTime usage
            'imageURL': urlDownload,
            'likes': likes,
            'profilePicture': userModel.photo,
            'shares': shares,
            'userName': userModel.username,
          });
        } else {
          // 5. Create a new post in Realtime Database
          await postRef.child(currentUser.uid).child((1).toString()).set({
            'comments': comments,
            'date': DateTime.now().toString(), // Fix for DateTime usage
            'imageURL': urlDownload,
            'likes': likes,
            'profilePicture': userModel.photo,
            'shares': shares,
            'userName': userModel.username,
          });
        }
      } catch (e) {
        print(e.toString());
        return left(LoginFailures(e.toString()));
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
