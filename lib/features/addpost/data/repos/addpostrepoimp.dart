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
// import 'package:starx/features/logins/data/model/usermodel.dart';

class Addpostrepoimp extends Addpostrepo {
  final ImagePicker _picker = ImagePicker();
  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore fireStoreRef = FirebaseFirestore.instance;
  final DatabaseReference postRef = FirebaseDatabase.instance.ref(kPost);

  File? imageee;

  @override
  Future<Either<Failure, dynamic>> addPhoto(
      int comments, int likes, int shares) async {
    try {
      // 1. Get photo from gallery
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      imageee = File(pickedFile!.path);
      final path = 'images/${pickedFile.name}';

      final ref = FirebaseStorage.instance.ref().child(path);
      UploadTask uploadTask = ref.putFile(imageee!);
      final snapshot = await uploadTask.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
        print(urlDownload.toString());
        // ... (rest of your code)
        return right(urlDownload);

    } on PlatformException catch (e) {
      return left(LoginFailures('PlatformException: ${e.message}'));
    } catch (e) {
      return left(LoginFailures('Unexpected error: $e'));
    }
  }
}

// // 3. Get user data from Firestore
// final userSnapshot =
// await fireStoreRef.collection('Users').doc(user!.uid).get();
// if (!userSnapshot.exists) {
//   return left(LoginFailures('User not found'));
// }
// final userModel = UserModel.fromMap(userSnapshot.data()!);

// 4. Get the last post number synchronously
// final postSnapshot = await postRef.child(user!.uid).get();
// int counter = 0;
//
// for (var child in postSnapshot.children) {
//   counter = int.parse(child.child('Number').value.toString());
// }

// // 5. Create a new post in Realtime Database
// await postRef.child(user!.uid).child((1).toString()).set({
//   'comments': comments,
//   'date': DateTime.now().toString(), // Fix for DateTime usage
//   'imageURL': 'urlDownload',
//   'likes': likes,
//   'profilePicture': 'userModel.photo',
//   'shares': shares,
//   'userName': 'userModel.username',
// });






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