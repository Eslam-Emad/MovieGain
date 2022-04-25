import 'package:movie_gain/core/constants/preferences_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SharedPreferencesHelper {
  static SharedPreferences? sP;

  static init() async {
    sP = await SharedPreferences.getInstance();
  }

  Future<bool> set(String key, String value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  Future<String?>? get(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  Future<String?> getToken() async => await get(PreferencesConstants.token);

  Future<void> clear() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
