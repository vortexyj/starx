import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/features/feed/presentation/manager/CreatePostCubit/create_post_cubit.dart';
import 'package:starx/features/feed/presentation/views/widgets/customfailurepostview.dart';
import 'package:starx/features/feed/presentation/views/widgets/customloadingpostview.dart';
import 'package:starx/features/feed/presentation/views/widgets/postsection.dart';

class CustomSilverList extends StatelessWidget {
  const CustomSilverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostState>(
      builder: (context, state) {
        if (state is CreatePostSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: PostBox(
                    userNamee: state.data.userName,
                    date: '2hr ago',
                    image: state.data.image,
                    likesNumber: state.data.likes,
                    commentsNumber: state.data.comments,
                    sharesNumber: state.data.shares,
                    imageUrl: state.data.image,
                  ),
                ); // Replace this with your item widget
              },
              childCount: 30, // Number of items in the list
            ),
          );
        } else if (state is CreatePostFailure) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: FailurePostView(
                    err: state.errMessage,
                  ),
                ); // Replace this with your item widget
              },
              childCount: 30, // Number of items in the list
            ),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: LoadingPostView(),
                ); // Replace this with your item widget
              },
              childCount: 30, // Number of items in the list
            ),
          );
        }
      },
    );
  }
}
