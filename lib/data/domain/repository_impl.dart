import 'package:screen_lock/data/domain/repository.dart';
import 'package:screen_lock/data/service/locale_secure_storage.dart';
import 'package:screen_lock/data/service/shared_preff_storage.dart';

class WeltradeRepositoryImpl extends WelTradeRepository {
  WeltradeRepositoryImpl({
    required this.sharedPrefStorage,
    required this.flutterSecureStorage,
  });

  final LocaleSecureStorage flutterSecureStorage;
  final SharedPrefStorageService sharedPrefStorage;

  @override
  Future<void> savePinCode(String pinCode) async {
    await flutterSecureStorage.savePinCode(pinCode);
  }

  @override
  Future<String?> getPinCode() async {
    return await flutterSecureStorage.getPinCode();
  }

  @override
  Future<void> setSkipForDay(bool value) async {
    await sharedPrefStorage.setSkipForDay(value);
  }

  @override
  Future<bool> getSkipForDay() async {
    return await sharedPrefStorage.getSkipForDay();
  }

  @override
  Future<void> setSkipForever(bool value) async {
    await sharedPrefStorage.setSkipForever(value);
  }

  @override
  Future<bool> getSkipForever() async {
    return await sharedPrefStorage.getSkipForever();
  }

  @override
  Future<void> setSkipForDayDate(String value) async {
    await sharedPrefStorage.setSkipForDayDate(value);
  }

  @override
  Future<String?> getSkipForDayDate() async {
    return await sharedPrefStorage.getSkipForDayDate();
  }
}