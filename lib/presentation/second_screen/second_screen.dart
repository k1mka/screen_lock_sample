import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/get.it.dart';
import 'package:screen_lock/presentation/second_screen/cubit/second_cubit.dart';
import 'package:screen_lock/presentation/second_screen/second_layout.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          SecondCubit(repository: getIt<WelTradeRepository>()),
      child: const SecondLayout(),
    );
  }
}
