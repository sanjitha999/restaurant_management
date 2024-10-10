// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel()
  ..error = json['error'] == null
      ? null
      : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse()
      ..errorCode = json['errorCode'] as String?
      ..type = json['type'] as String?
      ..message = json['message'] as String?
      ..code = (json['code'] as num?)?.toInt();

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'type': instance.type,
      'message': instance.message,
      'code': instance.code,
    };
