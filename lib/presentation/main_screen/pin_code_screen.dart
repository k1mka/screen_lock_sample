import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/get.it.dart';
import 'package:screen_lock/presentation/main_screen/cubit/pin_code_cubit.dart';
import 'package:screen_lock/presentation/main_screen/pin_code_layout.dart';

class PinCodeScreen extends StatelessWidget {
  const PinCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          PinCodeCubit(repository: getIt<WelTradeRepository>()),
      child: const PinCodeLayout(),
    );
  }
}