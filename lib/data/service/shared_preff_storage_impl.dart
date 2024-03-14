import 'package:shared_preferences/shared_preferences.dart';
import 'package:screen_lock/data/service/shared_preff_storage.dart';

class SharedPrefStorageImplements implements SharedPrefStorageService {
  @override
  Future<bool> getSkipForDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('skipForDay') ?? false;
  }

  @override
  Future<void> setSkipForDay(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('skipForDay', value);
  }

  @override
  Future<bool> getSkipForever() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('skipForever') ?? false;
  }

  @override
  Future<void> setSkipForever(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('skipForever', value);
  }

  @override
  Future<String?> getSkipForDayDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('skipForDayDate');
  }

  @override
  Future<void> setSkipForDayDate(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('skipForDayDate', value);
  }
}
