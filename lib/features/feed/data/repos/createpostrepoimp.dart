import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:starx/core/errors/failure.dart';
import 'package:starx/core/errors/randomerror.dart';
import 'package:starx/core/utils/constants.dart';
import 'package:starx/features/feed/data/model/postmodel.dart';
import 'package:starx/features/feed/data/repos/createpostrepo.dart';

class CreatePostRepoImp extends CreatPostRepo {
  User? currentUser = FirebaseAuth.instance.currentUser;
  final _db = FirebaseFirestore.instance;
  final ref = FirebaseDatabase.instance.ref(AppValuesPost.kPost);
  StreamSubscription? _streamSubscription;
  PostModel? postModel;

  //data list contain data
  List<PostModel> data = [];
  List<String> users = [];

  @override
  Future<Either<Failure, List<PostModel>>> loadPost() async {
    data.clear();
    // get all the users to filter them
    try {
      // Reference to the "Posts" node in the database
      DatabaseReference postsRef =
          FirebaseDatabase.instance.ref().child('Posts');
      // Get data snapshot from the "Posts" node
      DataSnapshot snapshot = await postsRef.get();
      if (snapshot.exists) {
        Map<dynamic, dynamic>? data = snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          // Iterate through each key in the map, which are the userUIDs
          data.forEach((key, value) {
            users.add(key); // Add each userUID to the list
          });
        }
      }
    } on FirebaseException catch (e) {
      return left(RandomError(e.toString()));
    }
    for (var user in users) {
      if (user != currentUser.toString()) {
        try {
          _streamSubscription =
              ref.child(user).limitToLast(1).onValue.listen((DatabaseEvent event) {
            for (var child in event.snapshot.children) {
              postModel = PostModel(
                comments: int.parse(
                    child.child(AppValuesPost.kComments).value.toString()),
                likes: int.parse(
                    child.child(AppValuesPost.kLikes).value.toString()),
                shares: int.parse(
                    child.child(AppValuesPost.kShares).value.toString()),
                image: child.child(AppValuesPost.kImageUrl).value.toString(),
                userName: child.child(AppValuesPost.kUserName).value.toString(),
                profilePicture:
                    child.child(AppValuesPost.kProfilePicture).value.toString(),
                date: child.child(AppValuesPost.kDate).value.toString(),
              );
              data.add(postModel!);
            }
          });
        } on FirebaseException catch (e) {
          return left(RandomError(e.toString()));
        }
      } else {
        continue;
      }
    }

    return right(data);
  }

  void dispose() {
    _streamSubscription?.cancel();
  }
}

//
// _streamSubscription = FirebaseDatabase.instance.ref().child(AppValuesPost.kPost)
//     .onValue
//     .listen((DatabaseEvent event) {
//   users.clear();
//   for (var child in event.snapshot.children) {
//     String userUID = child.key ?? "Unknown UID";
//     users.add(userUID);
//   }
// });

// final DocumentSnapshot<Map<String, dynamic>> snapshot = await _db
//     .collection('Posts')
//     .doc(user!.uid)
//     .collection('Numbers')
//     .doc('2')
//     .get();
//
// // final postData = snapshot.data().map((data)=> data() as Map<String, dynamic>)
// // Checking if the document exists
//
// print('i am here before the send data');
// Converting the document data to a PostModel object
