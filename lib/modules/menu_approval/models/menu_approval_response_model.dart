import 'package:json_annotation/json_annotation.dart';
import 'package:resturant_management/webservices/model/response_model.dart';

part 'menu_approval_response_model.g.dart';

@JsonSerializable()
class MenuApprovalResponseModel extends ResponseModel {
  MenuApprovalResponseModel({
    required super.code,
    required super.message,
  });

  factory MenuApprovalResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MenuApprovalResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuApprovalResponseModelToJson(this);
}

