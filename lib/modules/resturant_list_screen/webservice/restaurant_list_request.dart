import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resturant_management/modules/resturant_list_screen/caching/business_image_cache.dart';
import 'package:resturant_management/modules/resturant_list_screen/model/business_item.dart';
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class RestaurantListRequest with WebserviceUtils {
  final BusinessImageCache _imageCache = BusinessImageCache();

  Future<List<BusinessItem>?> getBusinessList({required String region}) async {
    final Map<String, String> queryParams = {
      'region': region,
      'type': 'RESTRAUNT',
    };
    final http.Response? response = await constructAndExecuteRequest(
      endpoint: EndPoints.getBusinessList,
      authenticated: true,
      method: HttpMethod.get,
      queryParams: queryParams,
    );
    if (response != null) {
      final String restaurantListJson = response.body;
      if (response.isSuccessful()) {
        final List<dynamic>? businessList =
            jsonDecode(restaurantListJson)['BusinessListResponse']
                ['businessList'];
        List<BusinessItem>? businessItemModelList =
            businessList?.map((item) => BusinessItem.fromJson(item)).toList();
        return businessItemModelList;
      } else {
        throw Exception(
            'Exception in getting the list ${response.reasonPhrase}');
      }
    } else {
      throw Exception('Exception in getting the list response is null');
    }
  }

  Future<BusinessImageCache?> fetchBusinessImage({
    required String businessId,
    required String imageId,
  }) async {
    final cachedImage = _imageCache.getImage(businessId+'_image_'+imageId);
    if (cachedImage != null) return _imageCache;
    final Map<String, String> queryParams = {
      'businessId': businessId,
      'imageId': imageId,
    };

    final http.Response? response = await constructAndExecuteRequest(
      endpoint: EndPoints.getBusinessImages,
      method: HttpMethod.get,
      authenticated: true,
      queryParams: queryParams,
    );

    if (response != null) {
      if (response.isSuccessful()) {
        final imageBytes = response.bodyBytes;
        _imageCache.addImage(businessId+'_image_'+imageId, imageBytes); // Add to cache
        return _imageCache;
      } else {
        throw Exception(
            'Exception in getting the business images ${response.reasonPhrase}');
      }
    } else {
      throw Exception(
          'Exception in getting the business images response is null');
    }
  }

  Future<void> uploadBusinessImage({
    required String businessId,
    required File imageFile,
  }) async {
    List<http.MultipartFile> files = [];
    files.add(await http.MultipartFile.fromPath(
      "image",
      imageFile.path,
    ));
    http.MultipartRequest request = await constructMultipartRequest(
      endpoint: EndPoints.uploadBusinessImage(businessId),
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
