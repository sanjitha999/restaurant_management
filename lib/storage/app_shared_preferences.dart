import 'dart:convert';

import 'package:resturant_management/modules/dashboard/models/master_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Preferences {
  static const String kAuthToken = "kAuthToken";
  static const String masterData = "masterData";
  static const String loginData = "loginData";

  static const Set<String> _persistentKeys = {
    kAuthToken,
    masterData,
    loginData,
  };

  Future getObjectPreference(String key) async {
    final preferences = await _getPreferences();
    final String? jsonString = preferences.getString(key);
    if (jsonString == null || jsonString.isEmpty) {
      return null;
    }
    return jsonDecode(jsonString);
  }

  Future<void> setObjectPreference(String key, dynamic object) async {
    final preferences = await _getPreferences();
    preferences.setString(key, jsonEncode(object));
  }

  Future<void> clearData() async {
    final preferences = await _getPreferences();
    for (final String key in preferences.getKeys()) {
      if (!_persistentKeys.contains(key)) {
        await preferences.remove(key);
      }
    }
  }

  Future<SharedPreferences> _getPreferences() async {
    return SharedPreferences.getInstance();
  }

  Future<SharedPreferences> clear() async {
    return SharedPreferences.getInstance();
  }

  Future<void> remove(String key) async {
    final preferences = await _getPreferences();
    preferences.remove(key);
  }

  /*================
      Preferences
   =================*/

  Future<String?> getAuthToken();

  Future<void> setAuthToken(String token);

  // Future<String?> getMasterDataModel();
  Future<MasterDataModel?> getMasterDataModel();

  Future<void> setMasterDataModel(MasterDataModel masterData);

  Future<void> setLoginData(String? data);

  Future<String?> getLoginData();
}

class AppPreferenceImpl extends Preferences {
  @override
  Future<String?> getAuthToken() async {
    return await getObjectPreference(Preferences.kAuthToken) as String?;
  }

  @override
  Future<MasterDataModel?> getMasterDataModel() async {
    var content = (await getObjectPreference(Preferences.masterData));
    if (content == null) {
      return null;
    }
    return MasterDataModel.fromJson(content as Map<String, dynamic>);
  }

  @override
  Future<void> setAuthToken(String token) async {
    await setObjectPreference(Preferences.kAuthToken, token);
  }

  @override
  Future<void> setMasterDataModel(MasterDataModel masterData) async {
    await setObjectPreference(Preferences.masterData, masterData);
  }

  @override
  Future<void> setLoginData(String? data) async {
    await setObjectPreference(Preferences.loginData, data);
  }

  @override
  Future<String?> getLoginData() async {
    return await getObjectPreference(Preferences.loginData);
  }
}
