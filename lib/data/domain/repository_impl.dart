import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/data/service/locale/locale_secure_storage.dart';
import 'package:screen_lock/data/service/remote/firebase_remote_config.dart';

class WeltradeRepositoryImpl extends WelTradeRepository {
  WeltradeRepositoryImpl({required this.remoteConfig,
    required this.flutterSecureStorage,
  });

  final RemoteConfig remoteConfig;
  final LocaleSecureStorage flutterSecureStorage;

  @override
  Future<void> savePinCode(String pinCode) async {
    await flutterSecureStorage.savePinCode(pinCode);
  }

  @override
  Future<String?> getPinCode() async {
    return await flutterSecureStorage.getPinCode();
  }

  @override
  Future<void> initRemoteConfig() async {
    await remoteConfig.initRemoteConfig();
  }
}
