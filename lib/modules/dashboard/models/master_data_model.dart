import 'package:json_annotation/json_annotation.dart';
import 'package:resturant_management/modules/license_upload/model/license_enum.dart';

part 'master_data_model.g.dart';

@JsonSerializable()
class MasterDataModel {
  @JsonKey(name: 'SecondLevelCheckItemMap')
  final SecondLevelCheckItemMapModel? secondLevelCheckItemMap;
  final List<String>? regions;
  @JsonKey(name: 'MENU_TYPES')
  final List<String>? menuTypes;
  @JsonKey(name: 'ROLES')
  final List<String>? roles;
  @JsonKey(name: 'FILES_REQUIRED_BY_BUSINESS')
  final List<LicenseCertificates>? filesRequiredByBusiness;
  @JsonKey(name: 'SCOPES')
  final List<String>? scopes;
  @JsonKey(name: 'ApprovalItemMap')
  final ApprovalItemMapModel? approvalItemMap;

  MasterDataModel({
    this.secondLevelCheckItemMap,
    this.regions,
    this.menuTypes,
    this.roles,
    this.filesRequiredByBusiness,
    this.scopes,
    this.approvalItemMap,
  });

  factory MasterDataModel.fromJson(Map<String, dynamic> json) =>
      _$MasterDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MasterDataModelToJson(this);
}

@JsonSerializable()
class SecondLevelCheckItemMapModel {
  final List<String>? checkList;
  final List<String>? mandatoryList;

  SecondLevelCheckItemMapModel({
    this.checkList,
    this.mandatoryList,
  });

  factory SecondLevelCheckItemMapModel.fromJson(Map<String, dynamic> json) =>
      _$SecondLevelCheckItemMapModelFromJson(json);

  Map<String, dynamic> toJson() => _$SecondLevelCheckItemMapModelToJson(this);
}

@JsonSerializable()
class ApprovalItemMapModel {
  final List<String>? checkList;
  final List<String>? seatCapacity;
  final List<String>? carParkingCapacity;
  final List<String>? kitchenHygiene;
  final List<String>? feedbackItemsList;
  final List<String>? feedbackPoints;

  ApprovalItemMapModel({
    this.checkList,
    this.seatCapacity,
    this.carParkingCapacity,
    this.kitchenHygiene,
    this.feedbackItemsList,
    this.feedbackPoints,
  });

  factory ApprovalItemMapModel.fromJson(Map<String, dynamic> json) =>
      _$ApprovalItemMapModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovalItemMapModelToJson(this);
}
