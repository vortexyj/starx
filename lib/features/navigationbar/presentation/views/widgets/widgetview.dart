import 'package:flutter/material.dart';
import 'package:starx/features/addpost/presentation/views/addpage.dart';
import 'package:starx/features/feed/presentation/views/feedpage.dart';
import 'package:starx/features/messages/presentation/views/messagespage.dart';
import 'package:starx/features/profile/presentation/views/profilepage.dart';
import 'package:starx/features/test/presentation/views/testpage.dart';

widgetViewer(int value) {
  if (value == 0) {
    return const FeedPage();
  } else if (value == 4) {
    return const ProfilePage();
  } else if (value == 1) {
    return const MessagesPage();
  } else if (value == 3) {
    return const TestPage();
  } else if (value == 2) {
    return const AddPage();
  } else {
    return const Center(child: Text('NoPageFound'));
  }
}
