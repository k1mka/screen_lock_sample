import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/get.it.dart';
import 'package:screen_lock/presentation/web_view_screen/cubit/web_view_cubit.dart';
import 'package:screen_lock/presentation/web_view_screen/web_view_layout.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          WebViewCubit(repository: getIt<WelTradeRepository>()),
      child: const WebViewLayout(),
    );
  }
}
