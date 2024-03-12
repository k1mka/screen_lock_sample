import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/get.it.dart';
import 'package:screen_lock/presentation/main_screen/main_screen.dart';
import 'package:screen_lock/presentation/second_screen/second_screen.dart';

class WeltradeApp extends StatelessWidget {
  const WeltradeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = getIt<WelTradeRepository>();
    const lightBlack = Color(0xFF1E1E1E);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: lightBlack,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: lightBlack,
      systemNavigationBarDividerColor: lightBlack,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return FutureBuilder<String?>(
      future: repo.getPinCode(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            title: 'Weltrade',
            home:  Scaffold(
                backgroundColor: lightBlack,
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
        } else {
          return MaterialApp(
            title: 'Weltrade',
            home: _getInitScreen(snapshot.data),
            );
        }
      },
    );
  }

  Widget _getInitScreen(String? pinCode) {
    return pinCode == null
        ? const PinCodeScreen()
        : const SecondScreen();
  }
}