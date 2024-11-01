import 'package:json_annotation/json_annotation.dart';

part 'owner_info_model.g.dart';

@JsonSerializable()
class OwnerInfoModel {
  final String? name;
  final String? mobileNo;
  final String? emailId;

  OwnerInfoModel({this.name, this.mobileNo, this.emailId});

  // Factory constructor for creating a new instance from a map.
  factory OwnerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerInfoModelFromJson(json);

  // Method for converting the instance into a map.
  Map<String, dynamic> toJson() => _$OwnerInfoModelToJson(this);
}
