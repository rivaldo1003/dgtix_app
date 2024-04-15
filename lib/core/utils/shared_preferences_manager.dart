import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const _keyToken = 'token';
  static const _keyName = 'name';
  static const _keyEmail = 'email';

  SharedPreferencesManager._privateConstructor();

  static final SharedPreferencesManager instance =
      SharedPreferencesManager._privateConstructor();

  // NAME
  Future<void> setName(String name) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(_keyName, name);
  }

  Future<String> getName() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(_keyName) ?? '';
  }

  // EMAIL
  Future<void> setEmail(String email) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(_keyEmail, email);
  }

  Future<String> getEmail() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(_keyEmail) ?? '';
  }

  // TOKEN
  Future<void> setToken(String token) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(_keyToken, token);
  }

  Future<String> getToken() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(_keyToken) ?? '';
  }

  Future deleteToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove(_keyToken);
  }

  Future deleteAll() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
  }
}
