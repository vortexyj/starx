import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starx/features/logins/presentation/manager/SetupCubit/setup_cubit_cubit.dart';
import 'package:starx/features/logins/presentation/views/widgets/setuppagebody.dart';

class CustomSetupPage extends StatelessWidget {
  const CustomSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetupCubitCubit(),
      child: SetupPagebody(),
    );
  }
}
