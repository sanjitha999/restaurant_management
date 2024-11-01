import 'dart:convert';

import 'package:resturant_management/modules/business_overview/webservices/business_overview_request.dart';

abstract class BusinessOverviewRepository {
  Future<Map<String,dynamic>?> getBusinessOverview({required String businessId});
}

class BusinessOverviewRepoImpl implements BusinessOverviewRepository {
  final BusinessOverviewRequest _request = BusinessOverviewRequest();

  @override
  Future<Map<String,dynamic>?> getBusinessOverview({required String businessId}) {
    return _request.getBusinessDetails(businessId: businessId);
  }
}

class BusinessOverviewMock implements BusinessOverviewRepository {
  @override
  Future<Map<String,dynamic>?> getBusinessOverview(
      {required String businessId}) async {
    const String businessResponseJson = '''
{
    "BusinessResponse": {
        "code": "200",
        "business": {
            "id": "671db14ca18d6f6be1dc7b7e",
            "type": "RESTRAUNT",
            "name": "Eat easy ",
            "phoneNo": "9867646646",
            "address": {
                "line1": "99",
                "line2": "Street 99",
                "landmark": "",
                "point": null,
                "location": {
                    "latitude": 12.983447631980615,
                    "longitude": 77.75156747549772
                },
                "pincode": "560066",
                "district": "Bengaluru",
                "state": "Karnataka",
                "country": "India"
            },
            "ownerInfo": {
                "name": "Tom",
                "mobileNo": "9854649766",
                "emailId": "tom@tom.com"
            },
            "createdDate": "2024-10-27T03:19:40.595+00:00",
            "updatedDate": null,
            "approvalStatus": "PENDING",
            "eligibleForSecondLevelApproval": false,
            "certificates": [
                {
                    "type": "LicenseCertificates.FoodLicenseCertificate",
                    "fileName": "6d520aa0-418c-437d-b906-43db84143c7b_Screenshot_2024-10-20-21-14-18-00_41a60df84a12e048b8b2bfba0c8c8999.jpg",
                    "number": "356"
                },
                {
                    "type": "LicenseCertificates.GSTCertificate",
                    "fileName": "41ae5e79-c452-4d87-9614-ae5f125992df_Screenshot_2024-10-20-21-14-18-00_41a60df84a12e048b8b2bfba0c8c8999.jpg",
                    "number": "968"
                },
                {
                    "type": "LicenseCertificates.TradeLicenseCertificate",
                    "fileName": "2106595b-0c72-48e7-b0e8-b93c0d864057_Screenshot_2024-10-20-21-14-18-00_41a60df84a12e048b8b2bfba0c8c8999.jpg",
                    "number": "467"
                },
                {
                    "type": "LicenseCertificates.WaterLicenseCertificate",
                    "fileName": "9bf6eb40-d479-4a4a-95fc-5df4c27ef0d2_Screenshot_2024-10-20-21-14-18-00_41a60df84a12e048b8b2bfba0c8c8999.jpg",
                    "number": "790"
                },
                {
                    "type": "LicenseCertificates.PestControlCertificate",
                    "fileName": "e21b5596-388b-428f-ac22-f0f8d60645c2_Screenshot_2024-10-20-21-14-18-00_41a60df84a12e048b8b2bfba0c8c8999.jpg",
                    "number": "789"
                }
            ],
            "approvalData": {
                "kitchenHygiene": "YES",
                "AC": "YES",
                "PurifiedWater": "YES",
                "seatCapacity": "10-15",
                "carParkingCapacity": "15Above",
                "restRoomCapacity": "Excellent",
                "restaurantCleanliness": "Average",
                "ambiance": "VeryGood"
            },
            "images": null,
            "secondLevelApprovalStatus": null
        },
        "message": "SUCCESS",
        "userList": []
    }
}
''';
    final Map<String, dynamic> businessResponseMap =
        jsonDecode(businessResponseJson);
    return businessResponseMap;
  }
}
