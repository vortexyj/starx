import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:starx/features/logins/data/model/usermodel.dart';
import 'package:starx/features/logins/data/repos/setupaccrepo/setupaccrepo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Setupaccrepoimp extends SetupAccRepo {
  @override
  Future<void> setupUserData(String photoURL, String userName, String account,
      int followers, int following, int posts) async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    UserModel newUser = UserModel(
      email: account,
      followers: followers,
      following: following,
      photo: photoURL,
      posts: posts,
      username: userName,
    );

    DocumentReference usersRef =
        FirebaseFirestore.instance.collection('Users').doc(currentUser!.uid);

    try {
      await usersRef.set(newUser.toMap());
      // ignore: avoid_print
      print('User added successfully');
    } catch (e) {
      // ignore: avoid_print
      print('Failed to add user: $e');
    }
  }
}
