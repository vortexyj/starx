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
