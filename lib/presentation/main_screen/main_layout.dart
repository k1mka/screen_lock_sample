import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late String passwordForButton2 = '';
  late bool isFirstTimeUser = false;

  @override
  void initState() {
    super.initState();
    _checkFirstTimeUser();
  }

  _checkFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTimeUser = prefs.getBool('first_time_user') ?? true;
    if (firstTimeUser) {
      setState(() {
        isFirstTimeUser = true;
      });
    } else {
      _loadPinCode();
    }
  }

  _loadPinCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pinCode = prefs.getString('pin_code');
    if (pinCode != null) {
      setState(() {
        passwordForButton2 = pinCode;
      });
    }
  }

  _savePinCode(String pinCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('pin_code', pinCode);
  }

  _setFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_time_user', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Lock'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: isFirstTimeUser
                ? createPasswordWidget()
                : enterPasswordWidget(),
          ),
        ),
      ),
    );
  }

  Widget createPasswordWidget() {
    return ElevatedButton(
      onPressed: () {
        final controller = InputController();
        screenLockCreate(
          context: context,
          inputController: controller,
          onConfirmed: (matchedText) {
            _savePinCode(matchedText);
            _setFirstTimeUser();
            setState(() {
              passwordForButton2 = matchedText;
              isFirstTimeUser = false;
            });
            Navigator.of(context).pop();
          },
          footer: TextButton(
            onPressed: () {
              controller.unsetConfirmed();
            },
            child: const Text('Reset input'),
          ),
        );
      },
      child: const Text('Create Password'),
    );
  }

  Widget enterPasswordWidget() {
    return ElevatedButton(
      onPressed: () => screenLock(
        context: context,
        correctString: passwordForButton2,
      ),
      child: const Text(
        'Enter Password',
        textAlign: TextAlign.center,
      ),
    );
  }
}
