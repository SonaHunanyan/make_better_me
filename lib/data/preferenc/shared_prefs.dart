import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences? _sharedPrefs;
  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  dynamic valueByKey(String key, {dynamic defaultValue}) {
    return _sharedPrefs?.get(key) ?? defaultValue;
  }

  Future<void> setString(String key, String value) async {
    await _sharedPrefs?.setString(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    await _sharedPrefs?.setBool(key, value);
  }

  Future<void> setInt(String key, int value) async {
    await _sharedPrefs?.setInt(key, value);
  }

  Future<void> remove(String key) async {
    await _sharedPrefs?.remove(key);
  }

  Set<String>? getKeys() => _sharedPrefs?.getKeys();
}
