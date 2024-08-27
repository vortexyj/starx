import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starx/features/addpost/presentation/manager/addpostcubit/add_post_cubit.dart';
import 'package:starx/features/addpost/presentation/views/widgets/addpagebody.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: AddPageBody(),
    );
  }
}
