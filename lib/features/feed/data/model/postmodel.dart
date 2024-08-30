import 'dart:ffi';

class PostModel {
  int comments;

  int likes;
  int shares;
  String image;
  String uid;

  PostModel({
    required this.comments,
    required this.likes,
    required this.shares,
    required this.image,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'comments': comments,
      'photo': image,
      'likes': likes,
      'shares': shares,
      'uid': uid,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      comments: map['comments'] ?? 'null',
      image: map['photo'] ?? 'null',
      likes: map['followers'] ?? 0,
      shares: map['following'] ?? 0,
      uid: map['uid'] ?? 'null',
    );
  }
}
