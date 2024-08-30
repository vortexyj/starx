import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starx/features/feed/presentation/manager/CreatePostCubit/create_post_cubit.dart';
import 'package:starx/features/feed/presentation/views/widgets/feedpagebody.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePostCubit()..fetchCreatePost(),
      child: const FeedPageBody(),
    );
  }
}
