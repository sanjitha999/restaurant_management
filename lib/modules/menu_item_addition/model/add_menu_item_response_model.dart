import 'package:json_annotation/json_annotation.dart';

part 'add_menu_item_response_model.g.dart';

@JsonSerializable()
class AddMenuItemResponseModel {
  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'businessId')
  final String businessId;

  @JsonKey(name: 'menuItemId')
  final String menuItemId;

  @JsonKey(name: 'message')
  final String message;

  AddMenuItemResponseModel({
    required this.code,
    required this.businessId,
    required this.menuItemId,
    required this.message,
  });

  factory AddMenuItemResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddMenuItemResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddMenuItemResponseModelToJson(this);
}

