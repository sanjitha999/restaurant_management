import 'package:json_annotation/json_annotation.dart';
import 'package:resturant_management/webservices/model/response_model.dart';
part 'restaurant_associate_response_model.g.dart';
@JsonSerializable()
class RestaurantAssociateResponseModel extends ResponseModel {
  RestaurantAssociateResponseModel({
    required super.code,
    required super.message,
  });

  factory RestaurantAssociateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantAssociateResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantAssociateResponseModelToJson(this);
}
