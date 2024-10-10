// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

LoginRequestWrapper _$LoginRequestWrapperFromJson(Map<String, dynamic> json) =>
    LoginRequestWrapper(
      loginRequest: LoginRequestModel.fromJson(
          json['LoginRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginRequestWrapperToJson(
        LoginRequestWrapper instance) =>
    <String, dynamic>{
      'LoginRequest': instance.loginRequest,
    };
