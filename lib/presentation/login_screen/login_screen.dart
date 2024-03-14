import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/get.it.dart';
import 'package:screen_lock/presentation/login_screen/cubit/login_cubit.dart';
import 'package:screen_lock/presentation/login_screen/login_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          LoginCubit(repository: getIt<WelTradeRepository>()),
      child: const LoginLayout(),
    );
  }
}
