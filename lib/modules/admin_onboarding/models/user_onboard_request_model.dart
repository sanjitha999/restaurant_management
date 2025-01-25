import 'package:json_annotation/json_annotation.dart';

part 'user_onboard_request_model.g.dart';

@JsonSerializable()
class UserOnboardRequestModel {
  @JsonKey(name: 'userName')
  final String userName;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'firstName')
  final String firstName;

  @JsonKey(name: 'lastName')
  final String? lastName;

  @JsonKey(name: 'mobileNumber')
  final int mobileNumber;

  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'dateOfBirth')
  final String dateOfBirth;

  @JsonKey(name: 'roles')
  final List<String> roles;

  @JsonKey(name: 'businessType')
  final String? businessType;

  @JsonKey(name: 'businessId')
  final String? businessId;

  UserOnboardRequestModel({
    required this.userName,
    required this.password,
    required this.firstName,
    this.lastName,
    required this.mobileNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.roles,
    this.businessId,
    this.businessType,
  });

  // Factory method for deserialization
  factory UserOnboardRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserOnboardRequestModelFromJson(json);

  // Method for serialization
  Map<String, dynamic> toJson() => _$UserOnboardRequestModelToJson(this);
}
