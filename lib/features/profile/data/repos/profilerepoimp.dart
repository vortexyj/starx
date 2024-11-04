import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:starx/core/errors/failure.dart';
import 'package:starx/core/errors/loginfailureserror.dart';
import 'package:starx/core/utils/constants.dart';
import 'package:starx/features/logins/data/model/usermodel.dart';
import 'package:starx/features/profile/data/repos/profilerepo.dart';

class ProfileRepoImp extends Profilerepo {
  final FirebaseFirestore fireStoreRef = FirebaseFirestore.instance;
  final DatabaseReference postRef =
      FirebaseDatabase.instance.ref(AppValuesPost.kPost);
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Future<Either<Failure, UserModel>> loadProfile() async {
    try {
      // Get user data from FireStore
      final userSnapshot =
          await fireStoreRef.collection('Users').doc(currentUser!.uid).get();
      if (!userSnapshot.exists) {
        return left(LoginFailures('User not found'));
      }
      final userModel = UserModel.fromMap(userSnapshot.data()!);

      return right(userModel);
    } on PlatformException catch (e) {
      return left(LoginFailures(e.toString()));
    }
  }
}
