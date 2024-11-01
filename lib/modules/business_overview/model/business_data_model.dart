import 'package:json_annotation/json_annotation.dart';
import 'package:resturant_management/modules/first_level_check/model/first_level_request_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/model/address_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/model/owner_info_model.dart';

part 'business_data_model.g.dart'; // Generated file

@JsonSerializable()
class BusinessDataModel {
  final String? id;
  final String? type;
  final String? name;
  final String? phoneNo;
  final AddressModel? address;
  final OwnerInfoModel? ownerInfo;
  final String? approvalStatus;
  final List<CertificateModel>? certificates;
  final ApprovalData? approvalData;

  BusinessDataModel({
    this.id,
    this.type,
    this.name,
    this.phoneNo,
    this.address,
    this.ownerInfo,
    this.approvalStatus,
    this.certificates,
    this.approvalData,
  });

  // Factory constructor for creating a new instance from a map
  factory BusinessDataModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessDataModelFromJson(json);

  // Method to convert an instance to a map
  Map<String, dynamic> toJson() => _$BusinessDataModelToJson(this);
}

@JsonSerializable()
class CertificateModel {
  final String? type;
  final String? fileName;
  final String? number;

  CertificateModel({
    this.type,
    this.fileName,
    this.number,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) =>
      _$CertificateModelFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateModelToJson(this);
}
