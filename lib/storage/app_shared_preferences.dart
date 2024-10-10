
import 'dart:convert';

import 'package:resturant_management/utils/string_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PreferencesKeys {
  kAuthToken(isPersistent: true);

  const PreferencesKeys({required this.isPersistent});
  final bool isPersistent;
}

class AppSharedPreferences {
  Future<SharedPreferences> _getPreferences() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  Future<bool> setStringForKey(PreferencesKeys key, String value) async {
    final SharedPreferences preferences = await _getPreferences();
    return preferences.setString(key.toString(), value);
  }

  Future<String?> getStringForKey(PreferencesKeys key) async {
    final SharedPreferences preferences = await _getPreferences();
    return preferences.getString(key.toString());
  }

  Future<bool> setBoolForKey(PreferencesKeys key, bool value) async {
    final SharedPreferences preferences = await _getPreferences();
    return preferences.setBool(key.toString(), value);
  }

  Future<bool?> getBoolForKey(PreferencesKeys key) async {
    final SharedPreferences preferences = await _getPreferences();
    return preferences.getBool(key.toString());
  }

  Future<bool> setValueForCustomKey(String key, bool value) async {
    final SharedPreferences preferences = await _getPreferences();
    return preferences.setBool(key, value);
  }

  Future<bool?> getValueForCustomKey(String key) async {
    final SharedPreferences preferences = await _getPreferences();
    return preferences.getBool(key);
  }

  Future<dynamic> getSecureObjectPreference(PreferencesKeys key) async {
    final SharedPreferences preferences = await _getPreferences();
    final jsonString = preferences.getString(key.toString());
    if (StringUtils.isNullOrEmpty(jsonString)) {
      return null;
    }
    return jsonDecode(jsonString!);
  }

  Future<void> setSecureObjectPreference(
      PreferencesKeys key,
      dynamic object,
      ) async {
    final SharedPreferences preferences = await _getPreferences();
    await preferences.setString(key.toString(), jsonEncode(object));
  }

  Future<bool> setIntForKey(PreferencesKeys key, int value) async {
    final SharedPreferences preferences = await _getPreferences();
    return preferences.setInt(key.toString(), value);
  }

  Future<int?> getIntForKey(PreferencesKeys key) async {
    final SharedPreferences preferences = await _getPreferences();
    return preferences.getInt(key.toString());
  }

  Future<bool> setDoubleForKey(PreferencesKeys key, double value) async {
    final SharedPreferences preferences = await _getPreferences();
    return preferences.setDouble(key.toString(), value);
  }

  Future<bool> isKeyAvailable(PreferencesKeys key) async {
    final SharedPreferences preferences = await _getPreferences();
    return preferences.containsKey(key.toString());
  }

  Future<double?> getDoubleForKey(PreferencesKeys key) async {
    final SharedPreferences preferences = await _getPreferences();
    return preferences.getDouble(key.toString());
  }

  Future<void> clearAllDataInPreference() async {
    final SharedPreferences preferences = await _getPreferences();

    final Set<String> persistentPrefs = {};
    for (final PreferencesKeys key in PreferencesKeys.values) {
      if (key.isPersistent) persistentPrefs.add(key.toString());
    }

    for (final String key in preferences.getKeys()) {
      if (!persistentPrefs.contains(key)) preferences.remove(key);
    }
  }
}