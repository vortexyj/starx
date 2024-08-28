import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starx/core/utils/colors.dart';
import 'package:starx/features/addpost/presentation/manager/addpostcubit/add_post_cubit.dart';

class AddPageBody extends StatelessWidget {
  const AddPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPostCubit, AddPostState>(
      listener: (context, state) {
        if (state is AddPostSuccess) {
          // ignore: avoid_print
          print('downloadlink: ${state.urlDownload}');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: ColorStyle.accentStroke,
            content: Text('uploaded successfully'),
            duration: Duration(seconds: 5),
          ));
        } else if (state is AddPostFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorStyle.accentStroke,
            content: Text(state.errMessage),
            duration: const Duration(seconds: 5),
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload Image to Firebase Storage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<AddPostCubit>().fetchAddPhoto();
                },
                child: const Text('Pick Image'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<AddPostCubit>().fetchAddPhoto();
                },
                child: const Text('Upload Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
