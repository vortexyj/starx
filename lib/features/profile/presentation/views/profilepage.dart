import 'package:flutter/material.dart';
import 'package:starx/features/profile/presentation/views/widgets/profilepagebody.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: ProfilePageBody());
  }
}
