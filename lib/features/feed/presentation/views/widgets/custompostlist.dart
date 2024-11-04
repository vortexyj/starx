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
      buildWhen: (previous, current) {
        if (previous.runtimeType != current.runtimeType) {
          return true;
        }

        if (previous is CreatePostSuccess && current is CreatePostSuccess) {
          // Compare the data property in CreatePostSuccess
          return previous.data != current.data;
        }
        return false;
      },
      builder: (context, state) {
        if (state is CreatePostSuccess) {
          if(state.data.isNotEmpty ){
            return SliverList(

              delegate: SliverChildBuilderDelegate(
                childCount:state.data.length ,
                    (context, index) {

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: PostBox(
                      userName: state.data[index].userName,
                      date: state.data[index].date,
                      profilePicture: state.data[index].profilePicture,
                      likesNumber: state.data[index].likes,
                      commentsNumber: state.data[index].comments,
                      sharesNumber: state.data[index].shares,
                      imageUrl: state.data[index].image,
                    ),
                  ); // Replace this with your item widget
                },
              ),
            );
          }
          else{
            return SliverList(

              delegate: SliverChildBuilderDelegate(
                childCount:state.data.length ,
                    (context, index) {

                  return const Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: PostBox(
                      userName: '',
                      date: '',
                      profilePicture: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7zGGDfbBb5uIXttFWx0AdWIQJce10XdjtMw&s',
                      likesNumber: 0,
                      commentsNumber: 0,
                      sharesNumber: 0,
                      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7zGGDfbBb5uIXttFWx0AdWIQJce10XdjtMw&s',
                    ),
                  ); // Replace this with your item widget
                },
              ),
            );
          }

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
