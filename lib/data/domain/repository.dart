abstract class WelTradeRepository {
  Future<void> savePinCode(String pinCode);

  Future<String?> getPinCode();

  Future<void> setSkipForDay(bool value);

  Future<bool> getSkipForDay();

  Future<void> setSkipForever(bool value);

  Future<bool> getSkipForever();

  Future<void> setSkipForDayDate(String value);

  Future<String?> getSkipForDayDate();
}