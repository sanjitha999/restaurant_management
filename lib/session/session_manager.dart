import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/modules/dashboard/models/master_data_model.dart';
import 'package:resturant_management/navigation/routes.dart';
import 'package:resturant_management/storage/app_shared_preferences.dart';
import 'package:resturant_management/utils/app_global_keys.dart';
import 'package:resturant_management/utils/user_role_extension.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() {
    return _instance;
  }

  final Preferences _prefs = AppDI.inject<Preferences>();

  UserRole? _userRole;

  SessionManager._internal();

  UserRole? getUserRole() {
    return _userRole;
  }

  void setUserRole(UserRole? userRole) {
    _userRole = userRole;
  }

  Future<MasterDataModel?> getMasterData() async {
    return await _prefs.getMasterDataModel();
  }

  Future<void> initiateLogout() async {
    await _prefs.clearData();
    await _prefs.clear();
    await Future.delayed(Duration(milliseconds: 100));
    if (AppGlobalKeys.navigatorKey.currentState != null) {
      AppGlobalKeys.navigatorKey.currentState?.pushNamedAndRemoveUntil(
        Routes.loginRoute,
        (route) => false,
      );
    } else {
      print("Navigator is still not available.");
    }
  }
}
