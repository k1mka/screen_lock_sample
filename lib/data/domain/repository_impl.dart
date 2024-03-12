import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/data/service/locale_secure_storage.dart';

class WeltradeRepositoryImpl extends WelTradeRepository {
  WeltradeRepositoryImpl({
    required this.flutterSecureStorage,
  });

  final LocaleSecureStorage flutterSecureStorage;

  @override
  Future<void> savePinCode(String pinCode) async {
    await flutterSecureStorage.savePinCode(pinCode);
  }

  @override
  Future<String?> getPinCode() async {
    return await flutterSecureStorage.getPinCode();
  }
}