import 'package:json_annotation/json_annotation.dart';
import 'package:resturant_management/webservices/model/response_model.dart';
part 'admin_create_response_model.g.dart';

@JsonSerializable()
class AdminCreateResponseModel extends ResponseModel {
  AdminCreateResponseModel({
    required super.code,
    required super.message,
  });

  factory AdminCreateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdminCreateResponseModelToJson(this);
}
