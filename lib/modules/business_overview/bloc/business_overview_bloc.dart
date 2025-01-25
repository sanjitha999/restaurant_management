import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/modules/business_overview/model/business_data_model.dart';
import 'package:resturant_management/modules/business_overview/model/business_info_item_model.dart';
import 'package:resturant_management/modules/business_overview/model/business_info_model.dart';
import 'package:resturant_management/modules/business_overview/webservices/business_overview_repository.dart';

part 'business_overview_event.dart';

part 'business_overview_state.dart';

class BusinessOverviewBloc
    extends Bloc<BusinessOverviewEvent, BusinessOverviewState> {
  final BusinessOverviewRepository repository;
  final String businessId;

  BusinessOverviewBloc({required this.repository, required this.businessId})
      : super(BusinessOverviewInitial()) {
    on<FetchBusinessOverviewEvent>(_fetchBusinessOverview);
    on<ApproveBusinessEvent>(_approveBusiness);
    on<RejectBusinessEvent>(_rejectBusiness);
  }

  Future<void> _fetchBusinessOverview(
    FetchBusinessOverviewEvent event,
    Emitter<BusinessOverviewState> emit,
  ) async {
    try {
      final Map<String, dynamic>? businessData =
          await repository.getBusinessOverview(businessId: businessId);

// Assuming businessData is non-null and contains the expected structure
      if (businessData != null) {
        final BusinessDataModel businessDataModel = BusinessDataModel.fromJson(
            businessData['BusinessResponse']['business']);
        List<BusinessInfoItemModel> restaurantItems = [
          BusinessInfoItemModel(
            title: "ID",
            value: businessDataModel.id ?? '',
          ),
          BusinessInfoItemModel(
            title: "Type",
            value: businessDataModel.type ?? '',
          ),
          BusinessInfoItemModel(
            title: "Restaurant Name",
            value: businessDataModel.name ?? '',
          ),
          BusinessInfoItemModel(
            title: "Phone No",
            value: businessDataModel.phoneNo ?? '',
          ),
        ];
        List<BusinessInfoItemModel> ownerItems = [
          BusinessInfoItemModel(
            title: "Name",
            value: businessDataModel.ownerInfo?.name ?? '',
          ),
          BusinessInfoItemModel(
            title: "Mobile No",
            value: businessDataModel.ownerInfo?.mobileNo ?? '',
          ),
          BusinessInfoItemModel(
            title: "Email Id",
            value: businessDataModel.ownerInfo?.emailId ?? '',
          ),
        ];
        List<BusinessInfoItemModel> addressItems = [
          BusinessInfoItemModel(
            title: "Line 1",
            value: businessDataModel.address?.line1 ?? '',
          ),
          BusinessInfoItemModel(
            title: "Line 2",
            value: businessDataModel.address?.line2 ?? '',
          ),
          BusinessInfoItemModel(
            title: "Pin code",
            value: businessDataModel.address?.pincode ?? '',
          ),
          BusinessInfoItemModel(
            title: "District",
            value: businessDataModel.address?.district ?? '',
          ),
          BusinessInfoItemModel(
            title: "State",
            value: businessDataModel.address?.state ?? '',
          ),
        ];
        List<BusinessInfoItemModel> certificateItems = _createCertificateItems(
          businessDataModel.certificates ?? [],
        );
        List<BusinessInfoItemModel> approvalList = [
          BusinessInfoItemModel(
            title: "Seat Capacity",
            value: businessDataModel.approvalData?.seatCapacity ?? '',
          ),
          BusinessInfoItemModel(
            title: "Ambiance",
            value: businessDataModel.approvalData?.ambiance ?? '',
          ),
          BusinessInfoItemModel(
            title: "Purified Water",
            value: businessDataModel.approvalData?.purifiedWater ?? '',
          ),
          BusinessInfoItemModel(
            title: "Air Conditioning",
            value: businessDataModel.approvalData?.ac ?? '',
          ),
          BusinessInfoItemModel(
            title: "Kitchen Hygiene",
            value: businessDataModel.approvalData?.kitchenHygiene ?? '',
          ),
          BusinessInfoItemModel(
            title: "Cleanliness",
            value: businessDataModel.approvalData?.restaurantCleanliness ?? '',
          ),
          BusinessInfoItemModel(
            title: "Car Parking Capacity",
            value: businessDataModel.approvalData?.carParkingCapacity ?? '',
          ),
          BusinessInfoItemModel(
            title: "Restroom Capacity",
            value: businessDataModel.approvalData?.restRoomCapacity ?? '',
          ),
        ];

        final List<BusinessInfoModel> businessInfoList = [
          BusinessInfoModel(
            title: "Business Information",
            items: restaurantItems,
          ),
          BusinessInfoModel(
            title: "Business Address",
            items: addressItems,
          ),
          BusinessInfoModel(
            title: "Owner Details",
            items: ownerItems,
          ),
          BusinessInfoModel(
            title: "Business Certificates",
            items: certificateItems,
          ),
          BusinessInfoModel(
            title: "Restaurant Amenities",
            items: approvalList,
          ),
        ];
        emit(DataFetchedState(infos: businessInfoList));
      } else {
      }
    } catch (e) {
     debugPrint("Error $e");
    }
  }

  List<BusinessInfoItemModel> _createCertificateItems(
      List<CertificateModel> certificates) {
    List<BusinessInfoItemModel> certificateItems = [];

    for (var certificate in certificates) {
      String title;

      switch (certificate.type) {
        case "LicenseCertificates.FoodLicenseCertificate":
          title = "Food License Certificate";
          break;
        case "LicenseCertificates.GSTCertificate":
          title = "GST Certificate";
          break;
        case "LicenseCertificates.TradeLicenseCertificate":
          title = "Trade License Certificate";
          break;
        case "LicenseCertificates.WaterLicenseCertificate":
          title = "Water License Certificate";
          break;
        case "LicenseCertificates.PestControlCertificate":
          title = "Pest Control Certificate";
          break;
        default:
          continue; // Skip any types that are not defined
      }

      certificateItems.add(
          BusinessInfoItemModel(title: title, value: certificate.number ?? ""));
    }

    return certificateItems;
  }

  Future<void> _approveBusiness(
    ApproveBusinessEvent event,
    Emitter<BusinessOverviewState> emit,
  ) async {
    try {
      await repository.approveRestaurant(businessId: businessId);
      emit(RequestSuccessful(message: 'Restaurant Approved Successfully'));
    } catch (e) {
      emit(RequestFailed(message: 'Request Failed, try again later'));
     debugPrint("Exception $e");
    }
  }

  Future<void> _rejectBusiness(
    RejectBusinessEvent event,
    Emitter<BusinessOverviewState> emit,
  ) async {
    try {
      await repository.rejectRestaurant(businessId: businessId);
      emit(RequestSuccessful(message: 'Restaurant Reject Successfully'));
    } catch (e) {
      emit(RequestFailed(message: 'Request Failed, try again later'));
     debugPrint("Exception $e");
    }
  }
}
