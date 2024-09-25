class PostModel {
  int comments;
  int likes;
  String userName;
  int shares;
  String image;
  String profileImage;
  String uid;

  PostModel({
    required this.comments,
    required this.userName,
    required this.profileImage,
    required this.likes,
    required this.shares,
    required this.image,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'comments': comments,
      'userName': userName,
      'profileImage': profileImage,
      'photo': image,
      'likes': likes,
      'shares': shares,
      'uid': uid,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      comments: map['comments'] ?? 'null',
      userName: map['userName'] ?? 'null',
      profileImage: map['profileImage'] ?? 'null',
      image: map['photo'] ?? 'null',
      likes: map['followers'] ?? 0,
      shares: map['following'] ?? 0,
      uid: map['uid'] ?? 'null',
    );
  }
}
