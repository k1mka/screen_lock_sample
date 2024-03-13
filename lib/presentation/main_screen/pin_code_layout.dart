import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:intl/intl.dart';
import 'package:screen_lock/data/service/shared_preff_storage_impl.dart';
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

  void _showPinCodeScreen() async {
    final controller = InputController();
    final sharedPrefStorage = SharedPrefStorageImplements();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      screenLockCreate(
        context: context,
        canCancel: canCancel,
        onCancelled: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Attention'),
                content: Text('Are you sure you want to skip this step?'),
                actions: [
                  TextButton(
                    onPressed: () async {
                      final tomorrow = DateTime.now().add(const Duration(hours: 12));
                      final formattedDate = DateFormat("dd-MM-yyyy").format(tomorrow);
                      await sharedPrefStorage.setSkipForDayDate(formattedDate);
                      Navigator.of(context).pop();
                      _navigateToWebView();
                    },
                    child: Text('Remind me in 1 day'),
                  ),
                  TextButton(
                    onPressed: () async {
                      await sharedPrefStorage.setSkipForever(true);
                      Navigator.of(context).pop();
                      _navigateToWebView();
                    },
                    child: Text('Skip it forever'),
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
          _navigateToWebView();
        },
        footer: TextButton(
          onPressed: controller.unsetConfirmed,
          child: const Text('Reset input'),
        ),
      );
    });
  }

  Future<void> _checkShouldShowPinCodeScreen() async {
    final bool skipForever = await context.read<PinCodeCubit>().getSkipForever();
    final String? skipForDayDate = await context.read<PinCodeCubit>().getSkipForDayDate();


    if (skipForever) {
      _navigateToWebView();
      return;
    }

    if (skipForDayDate != null) {
      final currentDate = DateTime.now();
      final savedDate = DateFormat("dd-MM-yyyy").parse(skipForDayDate);

      if (currentDate.isBefore(savedDate.add(const Duration(hours: 12)))) {
        _navigateToWebView();
        return;
      }
    }

    _showPinCodeScreen();
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
                child: Container(),
              ),
            ),
          );
        },
      ),
    );
  }
}
