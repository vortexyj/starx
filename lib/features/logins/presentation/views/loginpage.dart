import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starx/features/logins/data/repos/loginrepo/loginrepoimp.dart';
import 'package:starx/features/logins/presentation/manager/LoginCubit/login_cubit.dart';
import 'package:starx/features/logins/presentation/views/widgets/loginpagebody.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepoImp()),
      child: LoginPageBody(),
    );
  }
}
