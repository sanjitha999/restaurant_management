import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resturant_management/modules/menu_item_addition/model/add_menu_item_response_model.dart';
import 'package:resturant_management/modules/menu_item_addition/model/menu_item_model.dart';
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class MenuItemRequest with WebserviceUtils {
  Future<AddMenuItemResponseModel?> addMenuItem(
      {required MenuItemModel menuItem, required String businessId}) async {
    final requestBody = MenuItemModel().wrapAsMenuItemRequest(menuItem);
    final http.Response? response = await constructAndExecuteRequest(
      endpoint: EndPoints.addMenuItem(businessId),
      method: HttpMethod.post,
      authenticated: true,
      body: jsonEncode(requestBody),
    );

    if (response != null) {
      String jsonResponse = response.body;

      // Parse the JSON response
      Map<String, dynamic> parsedJson = jsonDecode(jsonResponse);

      // Extract the message
      AddMenuItemResponseModel responseModel =
          AddMenuItemResponseModel.fromJson(
        parsedJson['MenuItemUpdateResponse'],
      );
     debugPrint(
          'responseModel: $responseModel'); // Output: Menu added successfully.
      return responseModel;
      if (response.isSuccessful()) {
        // JSON response as a string
      } else {}
    }
    return null;
  }

  Future<void> uploadMenuItemImage({
    required String businessId,
    required String menuId,
    required File imageFile,
  }) async {
    List<http.MultipartFile> files = [];
    files.add(await http.MultipartFile.fromPath(
      "image",
      imageFile.path,
    ));
    http.MultipartRequest request = await constructMultipartRequest(
      endpoint: EndPoints.uploadMenuItemImage(businessId, menuId),
      method: HttpMethod.post,
      authenticated: true,
      files: files,
    );
    final response = await request.send();
    if (response.statusCode == 200) {
     debugPrint("MyTest :: done uploading image");
    } else {
      throw Exception("Couldn't upload image");
    }
  }
}
