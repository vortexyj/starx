import 'package:flutter/material.dart';
import 'package:starx/features/logins/data/repos/registerrepo/registerrepoimp.dart';
import 'package:starx/features/logins/presentation/manager/RegisterCubit/register_cubit.dart';
import 'package:starx/features/logins/presentation/views/widgets/signuppagebody.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(RegisterRepoImp()),
      child: SignupPageBody(),
    );
  }
}
