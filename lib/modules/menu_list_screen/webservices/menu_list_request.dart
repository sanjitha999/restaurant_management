import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:resturant_management/modules/menu_list_screen/model/menu_item_model.dart';
import 'package:resturant_management/modules/menu_list_screen/model/menu_list_response.dart';
import 'package:resturant_management/modules/menu_list_screen/util/menu_helper.dart';
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class MenuListRequest with WebserviceUtils {
  Future<List<MenuItemDisplayModel>?> getMenuList(
      {required String businessId}) async {
    final http.Response? response = await constructAndExecuteRequest(
      endpoint: EndPoints.getMenuList(businessId),
      authenticated: true,
      method: HttpMethod.get,
    );

    if (response != null) {
      if (response.isSuccessful()) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        final menuResponse =
        MenuListResponse.fromJson(jsonMap['MenuListResonse']);
        if (menuResponse.menuItemList.categories.isEmpty) {
          return [];
        }

       debugPrint(menuResponse
            .menuItemList.categories[0].subcategories[0].itemList[0].name);
        List<MenuItemDisplayModel> menuItemList =
        MenuHelper().getMenuItemModels(
          menuResponse.menuItemList,
        );
        return menuItemList;
      }
    }
    return null;
  }

  Future<Uint8List?> getMenuItemImage({
    required String menuId,
    required String businessId,
    required String imageId,
  }) async {
    final Map<String, String> queryParams = {
      'menuId': menuId,
      'businessId': businessId,
      'imageId': imageId,
    };

    final http.Response? response = await http.get(
      Uri.http(EndPoints.baseUrl, EndPoints.downloadMenuItemImage, queryParams),
      headers: await getRequestHeaders(authenticated: true),
    );


    // await constructAndExecuteRequest(
    //   endpoint: EndPoints.downloadMenuItemImage,
    //   authenticated: true,
    //   queryParams: queryParams,
    //   method: HttpMethod.get,
    // );

    if (response != null) {
      if (response.isSuccessful()) {
        return response.bodyBytes as Uint8List;
      } else {
      }
    } else {
    }
    return null;
  }
}
