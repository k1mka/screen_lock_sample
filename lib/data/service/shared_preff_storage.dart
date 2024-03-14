
abstract class SharedPrefStorageService {
  Future<bool> getSkipForDay();
  Future<void> setSkipForDay(bool value);

  Future<bool> getSkipForever();
  Future<void> setSkipForever(bool value);

  Future<String?> getSkipForDayDate();
  Future<void> setSkipForDayDate(String value);
}
