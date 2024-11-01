import 'dart:convert';

import 'package:resturant_management/di/di_initializer.dart';
import 'package:http/http.dart' as http;
import 'package:resturant_management/modules/dashboard/models/master_data_model.dart';
import 'package:resturant_management/storage/app_shared_preferences.dart';
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class MasterSyncRequest with WebserviceUtils {
  Future<void> getMasterSyncData() async {
    try {
      final http.Response? response = await constructAndExecuteRequest(
        endpoint: EndPoints.masterSync,
        method: HttpMethod.get,
        authenticated: true,
      );

      if (response != null) {
        if (response.isSuccessful()) {
          final decodedResponse = jsonDecode(response.body);
          final Preferences prefs = AppDI.inject<Preferences>();
          await prefs
              .setMasterDataModel(MasterDataModel.fromJson(decodedResponse));
        } else {
          final decodedResponse = jsonDecode(response.body);
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
