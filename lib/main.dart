import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:screen_lock/firebase_options.dart';
import 'package:screen_lock/get.it.dart';
import 'package:screen_lock/screen_lock_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServicesLocator();
  runApp(const WeltradeApp());
}
