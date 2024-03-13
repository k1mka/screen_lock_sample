import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:screen_lock/presentation/main_screen/cubit/main_cubit.dart';
import 'package:screen_lock/presentation/main_screen/cubit/main_state.dart';
import 'package:screen_lock/presentation/second_screen/cubit/second_cubit.dart';
import 'package:screen_lock/presentation/second_screen/cubit/second_state.dart';

class SecondLayout extends StatefulWidget {
  const SecondLayout({super.key});

  @override
  State<SecondLayout> createState() => _SecondLayoutState();
}

class _SecondLayoutState extends State<SecondLayout> {
  String? currentPinCode;
  bool canCancel = false;
  bool screenLockShown = false;

  @override
  void initState() {
    super.initState();
    _getPinCode();
  }

  Future<void> _getPinCode() async {
    currentPinCode = await context.read<SecondCubit>().getPinCode();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Hello"),
      ),
      body: BlocConsumer<SecondCubit, SecondState>(
          listener: (context, state) {
            if (state is SuccessLoadedSecondCodeState) {
              screenLock(
                context: context,
                canCancel: canCancel,
                correctString: currentPinCode!,
              );
            }
          },
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}
