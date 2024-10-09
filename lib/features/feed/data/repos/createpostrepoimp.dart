import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:starx/core/errors/failure.dart';
import 'package:starx/core/errors/randomerror.dart';
import 'package:starx/features/feed/data/model/postmodel.dart';
import 'package:starx/features/feed/data/repos/createpostrepo.dart';

class CreatePostRepoImp extends CreatPostRepo {
  User? user = FirebaseAuth.instance.currentUser;
  final _db = FirebaseFirestore.instance;
  @override
  Future<Either<Failure, PostModel>> loadPost() async {
    try {
      final usersCollectionRef = FirebaseFirestore.instance.collection("users");

      try {
        QuerySnapshot querySnapshot = await usersCollectionRef.get();

        // Iterate through each document
        for (var doc in querySnapshot.docs) {
          // Convert document data to a Map
          Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;

          // Convert each field to a string
          userData.forEach(
            (key, value) {
              String dataAsString = value.toString();
              print('heyyy $key: $dataAsString');
            },
          );
        }
      } catch (e) {
        print('Error fetching users: $e');
      }

      final DocumentSnapshot<Map<String, dynamic>> snapshot = await _db
          .collection('Posts')
          .doc(user!.uid)
          .collection('Numbers')
          .doc('5')
          .get();

      // final postData = snapshot.data().map((data)=> data() as Map<String, dynamic>)
      // Checking if the document exists

      print('i am here before the send data');
      // Converting the document data to a PostModel object
      return right(PostModel.fromMap(snapshot.data()!));
    } on FirebaseException catch (e) {
      return left(RandomError(e.toString()));
    }
  }
}
