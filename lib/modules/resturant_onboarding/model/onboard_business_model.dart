import 'package:json_annotation/json_annotation.dart';
import 'package:resturant_management/modules/resturant_onboarding/model/address_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/model/owner_info_model.dart';

part 'onboard_business_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OnBoardBusinessModel {
  final String type;
  final String name;
  final AddressModel address;
  final String phoneNo;
  final OwnerInfoModel ownerInfo;

  OnBoardBusinessModel({
    required this.type,
    required this.name,
    required this.address,
    required this.phoneNo,
    required this.ownerInfo,
  });

  factory OnBoardBusinessModel.fromJson(Map<String, dynamic> json) =>
      _$OnBoardBusinessModelFromJson(json);

  // Manually add a wrapper around the generated JSON
  Map<String, dynamic> toJson() {
    return {
      'OnBoardBusinessRequest': _$OnBoardBusinessModelToJson(this),
    };
  }
}

enum BusinessType {
  restaurant('RESTRAUNT');

  final String name;

  const BusinessType(this.name);
}
