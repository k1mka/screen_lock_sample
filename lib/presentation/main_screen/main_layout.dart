import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:screen_lock/presentation/main_screen/cubit/main_cubit.dart';
import 'package:screen_lock/presentation/main_screen/cubit/main_state.dart';
import 'package:screen_lock/presentation/second_screen/second_screen.dart';

class PinCodeLayout extends StatefulWidget {
  const PinCodeLayout({super.key});

  @override
  State<PinCodeLayout> createState() => _PinCodeLayoutState();
}

class _PinCodeLayoutState extends State<PinCodeLayout> {
  late String correctPinCode;
  String? currentPinCode;
  bool canCancel = false;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Lock'),
      ),
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
    final controller = InputController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenLockCreate(
        context: context,
        canCancel: canCancel,
        inputController: controller,
        onConfirmed: (matchedText) {
          correctPinCode = matchedText;
          _savePinCode(matchedText);
          _navigateToWebView();
        },
        footer: TextButton(
          onPressed: controller.unsetConfirmed,
          child: const Text('Reset input'),
        ),
      );
    });

    return Container();
  }

}
