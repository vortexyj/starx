import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Testappbody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User to Firestore'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            UserModel newUser = UserModel(
              email: 'example@example.com',
              followers: 10,
              following: 5,
              photo: 'https://example.com/photo.jpg',
              posts: 2,
              username: 'exampleUser',
            );

            addUser(newUser);
          },
          child: Text('Add User'),
        ),
      ),
    );
  }

  Future<void> addUser(UserModel user) async {
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection('Users');

    try {
      await usersRef.add(user.toMap());
      print('User added successfully');
    } catch (e) {
      print('Failed to add user: $e');
    }
  }
}

class UserModel {
  String email;
  int followers;
  int following;
  String photo;
  int posts;
  String username;

  UserModel({
    required this.email,
    required this.followers,
    required this.following,
    required this.photo,
    required this.posts,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'followers': followers,
      'following': following,
      'photo': photo,
      'posts': posts,
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? 'null',
      followers: map['followers'] ?? 0,
      following: map['following'] ?? 0,
      photo: map['photo'] ?? 'null',
      posts: map['posts'] ?? 0,
      username: map['username'] ?? 'null',
    );
  }
}
