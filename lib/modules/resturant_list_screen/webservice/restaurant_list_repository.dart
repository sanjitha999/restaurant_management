import 'dart:convert';
import 'dart:io';

import 'package:resturant_management/modules/resturant_list_screen/caching/business_image_cache.dart';
import 'package:resturant_management/modules/resturant_list_screen/model/business_item.dart';
import 'package:resturant_management/modules/resturant_list_screen/webservice/restaurant_list_request.dart';

abstract class RestaurantListRepository {
  Future<List<BusinessItem>?> getRestaurantList({required String region});

  Future<void> uploadBusinessImage({
    required String businessId,
    required File imageFile,
  });

  Future<BusinessImageCache?> fetchBusinessImage({
    required String businessId,
    required String imageId,
  });
}

class RestaurantListRepoImpl implements RestaurantListRepository {
  final RestaurantListRequest _request = RestaurantListRequest();

  @override
  Future<List<BusinessItem>?> getRestaurantList({required String region}) {
    return _request.getBusinessList(region: region);
  }

  @override
  Future<void> uploadBusinessImage(
      {required String businessId, required File imageFile}) {
    return _request.uploadBusinessImage(
        businessId: businessId, imageFile: imageFile);
  }

  @override
  Future<BusinessImageCache?> fetchBusinessImage({
    required String businessId,
    required String imageId,
  }) async {
    return _request.fetchBusinessImage(
      businessId: businessId,
      imageId: imageId,
    );
  }
}

class RestaurantListRepoMock implements RestaurantListRepository {
  @override
  Future<List<BusinessItem>?> getRestaurantList(
      {required String region}) async {
    const String restaurantListJson = '''{
    "BusinessListResponse": {
        "code": "200",
        "businessList": [
            {
                "id": "67023744a18d6f6be1dc7b76",
                "type": "RESTRAUNT",
                "name": "Bangarupalyam Restaurant1",
                "phoneNo": "6891017101",
                "address": {
                    "line1": " Bangarupalyam Road, Chittoor",
                    "line2": "",
                    "landmark": "",
                    "point": null,
                    "location": {
                        "latitude": 13.1874,
                        "longitude": 79.052
                    },
                    "pincode": "517416",
                    "district": "Chittoor",
                    "state": "Andhra Pradesh",
                    "country": "India"
                },
                "ownerInfo": {
                    "name": "GK Gnani",
                    "mobileNo": "9876543210",
                    "emailId": "testing@gmail.com"
                },
                "createdDate": "2024-10-06T07:07:48.819+00:00",
                "updatedDate": null,
                "approvalStatus": "PENDING",
                "eligibleForSecondLevelApproval": false,
                "certificates": null,
                "approvalData": null,
                "images": null,
                "secondLevelApprovalStatus": null
            },
            {
                "id": "671dae41a18d6f6be1dc7b7b",
                "type": "RESTRAUNT",
                "name": "Bangarupalyam Restaurant1",
                "phoneNo": "6891017101",
                "address": {
                    "line1": " Bangarupalyam Road, Chittoor",
                    "line2": "",
                    "landmark": "",
                    "point": null,
                    "location": {
                        "latitude": 13.1874,
                        "longitude": 79.052
                    },
                    "pincode": "517416",
                    "district": "Chittoor",
                    "state": "Andhra Pradesh",
                    "country": "India"
                },
                "ownerInfo": {
                    "name": "GK Gnani",
                    "mobileNo": "9876543210",
                    "emailId": "testing@gmail.com"
                },
                "createdDate": "2024-10-27T03:06:41.213+00:00",
                "updatedDate": null,
                "approvalStatus": "PENDING",
                "eligibleForSecondLevelApproval": false,
                "certificates": null,
                "approvalData": null,
                "images": null,
                "secondLevelApprovalStatus": null
            }
        ]
    }
}''';
    final List<dynamic>? businessList =
        jsonDecode(restaurantListJson)['BusinessListResponse']['businessList'];
    List<BusinessItem>? businessItemModelList =
        businessList?.map((item) => BusinessItem.fromJson(item)).toList();
    return businessItemModelList;
  }

  @override
  Future<void> uploadBusinessImage(
      {required String businessId, required File imageFile}) {
    // TODO: implement uploadBusinessImage
    throw UnimplementedError();
  }

  @override
  Future<BusinessImageCache> fetchBusinessImage({
    required String businessId,
    required String imageId,
  }) {
    // TODO: implement fetchBusinessImage
    throw UnimplementedError();
  }
}
