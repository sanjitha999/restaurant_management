import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart'; // This part will be generated

@JsonSerializable()
class LoginRequestModel {
  final String username;
  final String password;

  LoginRequestModel({required this.username, required this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}

@JsonSerializable()
class LoginRequestWrapper {
  @JsonKey(name: 'LoginRequest') // Specifies the key in the JSON
  final LoginRequestModel loginRequest;

  LoginRequestWrapper({required this.loginRequest});

  factory LoginRequestWrapper.fromJson(Map<String, dynamic> json) => _$LoginRequestWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestWrapperToJson(this);
}
