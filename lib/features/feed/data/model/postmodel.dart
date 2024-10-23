class PostModel {
  final int comments;
  final String date;
  final String imageURL;
  final int likes;
  final String profilePicture;
  final int shares;
  final String userName;
  final List<String> viewers;

  PostModel({
    required this.comments,
    required this.date,
    required this.imageURL,
    required this.likes,
    required this.profilePicture,
    required this.shares,
    required this.userName,
    required this.viewers,
  });

  // Factory constructor to convert JSON to a Post object
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      comments: json['comments'] ?? 0,
      date: json['date'] ?? '',
      imageURL: json['imageURL'] ?? '',
      likes: json['likes'] ?? 0,
      profilePicture: json['profilePicture'] ?? '',
      shares: json['shares'] ?? 0,
      userName: json['userName'] ?? '',
      viewers: (json['viewers'] as Map<String, dynamic>?)?.keys.toList() ?? [],
    );
  }

  // Convert Post object to JSON
  Map<String, dynamic> toJson() {
    return {
      'comments': comments,
      'date': date,
      'imageURL': imageURL,
      'likes': likes,
      'profilePicture': profilePicture,
      'shares': shares,
      'userName': userName,
      'viewers': {for (var uid in viewers) uid: true},  // Store viewers as a map
    };
  }
}


class UserPosts {
  final String userUID;
  final List<PostModel> posts;

  UserPosts({
    required this.userUID,
    required this.posts,
  });

  // Factory constructor to convert JSON to UserPosts
  factory UserPosts.fromJson(String userUID, Map<String, dynamic> json) {
    List<PostModel> posts = json.entries
        .map((entry) => PostModel.fromJson(Map<String, dynamic>.from(entry.value)))
        .toList();
    return UserPosts(userUID: userUID, posts: posts);
  }
}

class Viewer {
  final String userId;

  Viewer({required this.userId});

  factory Viewer.fromJson(String userId) {
    return Viewer(userId: userId);
  }
}
