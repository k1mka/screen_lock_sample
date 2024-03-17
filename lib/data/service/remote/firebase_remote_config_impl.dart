import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:screen_lock/data/service/remote/firebase_remote_config.dart';

class FirebaseRemoteConfigImpl extends RemoteConfig {
  @override
  Future<void> initRemoteConfig() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await remoteConfig.fetchAndActivate();
    } on FirebaseException catch (e, st) {
      log('Unable to initialize Firebase Remote Config',
          error: e, stackTrace: st);
    }
  }
}
