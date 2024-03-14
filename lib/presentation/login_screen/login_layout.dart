import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_lock/presentation/login_screen/cubit/login_cubit.dart';
import 'package:screen_lock/presentation/login_screen/cubit/login_state.dart';
import 'package:screen_lock/presentation/web_view_screen/web_view_screen.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout({super.key});

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  static const appBarTitle = "Login";
  static const buttonTitle = "Sign in via Apple ID";

  void appleSignIn() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const WebViewScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 700,
                ),
                child: ElevatedButton(
                  onPressed: appleSignIn,
                  child: const Text(buttonTitle),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
