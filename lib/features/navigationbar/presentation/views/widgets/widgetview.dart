import 'package:flutter/material.dart';
import 'package:starx/features/feed/presentation/views/feedpage.dart';
import 'package:starx/features/profile/presentation/views/profilepage.dart';

widgetViewer(int value) {
  if (value == 0) {
    return const FeedPage();
  } else if (value == 4) {
    return const ProfilePage();
  } else {
    return const Center(child: Text('NoPageFound'));
  }
}
