import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starx/features/profile/presentation/manager/profilecubit/profile_cubit.dart';
import 'package:starx/features/profile/presentation/views/widgets/profilepagebody.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileCubit(),
    child: const ProfilePageBody(),);
  }
}