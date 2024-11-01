// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_restaurant_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnBoardBusinessResponse _$OnBoardBusinessResponseFromJson(
        Map<String, dynamic> json) =>
    OnBoardBusinessResponse(
      code: json['code'] as String,
      id: json['id'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$OnBoardBusinessResponseToJson(
        OnBoardBusinessResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'message': instance.message,
    };

SubmitRestaurantResponse _$SubmitRestaurantResponseFromJson(
        Map<String, dynamic> json) =>
    SubmitRestaurantResponse(
      onBoardBusinessResponse: OnBoardBusinessResponse.fromJson(
          json['OnBoardBusinessResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubmitRestaurantResponseToJson(
        SubmitRestaurantResponse instance) =>
    <String, dynamic>{
      'OnBoardBusinessResponse': instance.onBoardBusinessResponse,
    };
