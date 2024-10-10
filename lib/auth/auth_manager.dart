import 'package:resturant_management/storage/app_shared_preferences.dart';
import 'package:resturant_management/utils/string_utils.dart';

class AuthManager {
  Future<String?> getAuthToken() async {
    String? prevAuthToken = await AppSharedPreferences()
        .getStringForKey(PreferencesKeys.kAuthToken);
    return prevAuthToken;
  }

  Future<String>? refreshAuthToken() async {
    return "";
  }

  Future<bool> isAuthenticated() async {
    String? prevAuthToken = await AppSharedPreferences()
        .getStringForKey(PreferencesKeys.kAuthToken);
    print("prevAUthToken $prevAuthToken");
    return StringUtils.isNullOrEmpty(prevAuthToken);
  }
}
