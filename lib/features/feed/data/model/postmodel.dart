import 'dart:ffi';

class PostModel {
  int comments;
  String profilePicture;
  int likes;
  int shares;
  String image;
  String userName;
  String date;

  PostModel({
    required this.comments,
    required this.profilePicture,
    required this.likes,
    required this.shares,
    required this.image,
    required this.userName,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'comments': comments,
      'profilePicture': profilePicture,
      'photo': image,
      'likes': likes,
      'shares': shares,
      'userName': userName,
      'date': date,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      comments: map['comments'] ?? 'null',
      profilePicture: map['profilePicture'] ?? 'null',
      image: map['photo'] ?? 'null',
      likes: map['followers'] ?? 0,
      shares: map['following'] ?? 0,
      userName: map['userName'] ?? 'null',
      date: map['date'] ?? 'null',
    );
  }
}
