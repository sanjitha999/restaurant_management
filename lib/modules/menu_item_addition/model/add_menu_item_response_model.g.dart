// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_menu_item_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMenuItemResponseModel _$AddMenuItemResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddMenuItemResponseModel(
      code: json['code'] as String,
      businessId: json['businessId'] as String,
      menuItemId: json['menuItemId'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$AddMenuItemResponseModelToJson(
        AddMenuItemResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'businessId': instance.businessId,
      'menuItemId': instance.menuItemId,
      'message': instance.message,
    };
