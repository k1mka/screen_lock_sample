import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:screen_lock/presentation/main_screen/cubit/pin_code_cubit.dart';
import 'package:screen_lock/presentation/main_screen/cubit/pin_code_state.dart';

import '../second_screen/second_screen.dart';

class PinCodeLayout extends StatefulWidget {
  const PinCodeLayout({super.key});

  @override
  State<PinCodeLayout> createState() => _PinCodeLayoutState();
}

class _PinCodeLayoutState extends State<PinCodeLayout> {
  late String correctPinCode;
  String? currentPinCode;
  bool canCancel = true;

  @override
  void initState() {
    super.initState();
    _checkShouldShowPinCodeScreen();
  }

  void _navigateToWebView() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SecondScreen(),
      ),
    );
  }

  void _savePinCode(String pinCode) async {
    await context.read<PinCodeCubit>().setPinCode(pinCode);
  }

  Future<void> _checkShouldShowPinCodeScreen() async {
    bool skipForDay =  await context.read<PinCodeCubit>().getSkipForDay();
    if (!skipForDay) {
      // If user hasn't skipped for a day, show the pin code screen
      _showPinCodeScreen();
    }
  }

  void _showPinCodeScreen() {
    final controller = InputController();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      screenLockCreate(
        context: context,
        canCancel: canCancel,
        onCancelled: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Внимание'),
                content: Text('Вы точно хотите пропустить этот шаг?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      _skipForDay();
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SecondScreen(),
                        ),
                      );
                    },
                    child: Text('Напомнить через 1 день'),
                  ),
                  TextButton(
                    onPressed: () {
                      _skipForever();
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SecondScreen(),
                        ),
                      );
                    },
                    child: Text('Пропустить навсегда'),
                  ),
                ],
              );
            },
          );
        },
        inputController: controller,
        onConfirmed: (matchedText) async {
          correctPinCode = matchedText;
          _savePinCode(matchedText);
          await _handleSkipForDay();
          _navigateToWebView();
        },
        footer: TextButton(
          onPressed: controller.unsetConfirmed,
          child: const Text('Reset input'),
        ),
      );
    });
  }

  Future<void> _handleSkipForDay() async {
    await context.read<PinCodeCubit>().setSkipForDay(true);
    await context.read<PinCodeCubit>().setSkipForDayDate(_getTodayDateString());
  }
  void _skipForDay() async {
    await context.read<PinCodeCubit>().setSkipForDay(true);
  }

  void _skipForever() async {
    await context.read<PinCodeCubit>().setSkipForDay(true);
    await context.read<PinCodeCubit>().setSkipForever(true);
  }

  String _getTodayDateString() {
    DateTime now = DateTime.now();
    return '${now.year}-${now.month}-${now.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PinCodeCubit, PinCodeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 700,
                ),
                child: createPasswordWidget(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget createPasswordWidget() {
    return Container(); // You can implement this as needed
  }
}
