abstract class LocaleSecureStorage {
  Future<void> savePinCode(String pinCode);

  Future<String?> getPinCode();
}