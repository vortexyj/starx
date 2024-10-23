import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:starx/core/errors/failure.dart';
import 'package:starx/core/errors/randomerror.dart';
import 'package:starx/features/feed/data/model/postmodel.dart';
import 'package:starx/features/feed/data/repos/createpostrepo.dart';

class CreatePostRepoImp extends CreatPostRepo {
  User? user = FirebaseAuth.instance.currentUser;
  final _db = FirebaseFirestore.instance;
  final DatabaseReference postRef = FirebaseDatabase.instance.ref();

  @override
  Future<Either<Failure, PostModel>> loadPost() async {
    //
    try {
      // Get the snapshot from Firebase for the given user and post
      final snapshot = await postRef.child('Posts').child(user!.uid).child('1').get();

      if (snapshot.exists) {
        // Convert the snapshot data into a PostModel
        final post = PostModel.fromJson(snapshot.value as Map<String, dynamic>);
        return Right(post); // Success case
      } else {
        return Left(RandomError('No data found')); // Post not found case
      }
    } catch (e) {
      return Left(RandomError(e.toString())); // Error case
    }
  }
}






// _db.collection("Posts").get().then(
//         (querySnapshot) {
//       print("Successfully completed");
//       for (var docSnapshot in querySnapshot.docs) {
//         print('${docSnapshot.id} => ${docSnapshot.data()}');
//       }
//     },
//     onError: (e) => print("Error completing: $e"),
//   );


//
//
// try {
//   QuerySnapshot querySnapshot = await usersCollectionRef.get();
//
//   // Iterate through each document
//   for (var doc in querySnapshot.docs) {
//     // Convert document data to a Map
//     Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
//
//     // Convert each field to a string
//     userData.forEach(
//       (key, value) {
//         String dataAsString = value.toString();
//         print('heyyy $key: $dataAsString');
//       },
//     );
//   }
// } catch (e) {
//   print('Error fetching users: $e');
// }
/////
//   try {
// QuerySnapshot<Map<String, dynamic>> querySnapshot =await
//   _db.collection('Posts').doc().get() ;
//
//   // Extract data from each document in the snapshot
//
// print('size: ${querySnapshot.size}');
//   // for (QueryDocumentSnapshot doc in querySnapshot.) {
//   //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//   //   print('Data: $data');
//   // }
// } catch (e) {
//   print('Error fetching data: $e');
// }
// final postData = snapshot.data().map((data)=> data() as Map<String, dynamic>)
// Checking if the document exists


// Converting the document data to a PostModel object