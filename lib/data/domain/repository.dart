abstract class WelTradeRepository {
  Future<void> savePinCode(String pinCode);

  Future<String?> getPinCode();

  Future<void> initRemoteConfig();
}
