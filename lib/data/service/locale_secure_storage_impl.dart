import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:screen_lock/data/service/locale_secure_storage.dart';

class LocaleSecureStorageImpl extends LocaleSecureStorage{
  LocaleSecureStorageImpl(this.flutterSecureStorage);

  static const firstTimeCodeKey = 'first_time_user';
  static const pinCodeKey = 'pin_code';
  static const authPinCodeKey = 'auth_pin_code';
  final FlutterSecureStorage flutterSecureStorage;

  @override
  Future<void> savePinCode(String pinCode) async {
    await flutterSecureStorage.write(key: pinCodeKey, value: pinCode);
  }

  @override
  Future<String?> getPinCode() async {
    return await flutterSecureStorage.read(key: pinCodeKey);
  }
}