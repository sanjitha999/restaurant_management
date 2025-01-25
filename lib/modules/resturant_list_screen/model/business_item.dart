import 'package:json_annotation/json_annotation.dart';
import 'package:resturant_management/modules/resturant_list_screen/model/image_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/model/address_model.dart';

part 'business_item.g.dart';

@JsonSerializable()
class BusinessItem {
  final String? id;
  final String? type;
  final String? name;
  final AddressModel? address;
  final String? approvalStatus;
  final bool? eligibleForSecondLevelApproval;
  final String? secondLevelApprovalStatus;
  final List<ImageItem>? images;
  // final String? secondLevelApprovalStatus;

  BusinessItem({
    this.id,
    this.type,
    this.name,
    this.address,
    this.approvalStatus,
    this.eligibleForSecondLevelApproval,
    this.secondLevelApprovalStatus,
    this.images,
    // this.secondLevelApprovalStatus,
  });

  factory BusinessItem.fromJson(Map<String, dynamic> json) =>
      _$BusinessItemFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessItemToJson(this);
}


enum ApprovalStatus {
  approved('APPROVED'),
  pending('PENDING');
  final String val;

  const ApprovalStatus(this.val);

}