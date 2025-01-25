import 'package:json_annotation/json_annotation.dart';

part 'business_user_models.g.dart';

@JsonSerializable()
class BusinessUserListResponse {
  final String? code;
  final List<BusinessUser>? businessList;

  BusinessUserListResponse({
    this.code,
    this.businessList,
  });

  factory BusinessUserListResponse.fromJson(Map<String, dynamic> json) => _$BusinessUserListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessUserListResponseToJson(this);
}

@JsonSerializable()
class BusinessUser {
  final String? id;
  final String? userName;
  final String? password;
  final String? firstName;
  final String? lastName;
  final int? mobileNumber;
  final String? address;
  final String? gender;
  final String? dateOfBirth;
  final List<String>? roles;
  final String? businessType;
  final String? region;
  final String? businessId;

  BusinessUser({
    this.id,
    this.userName,
    this.password,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.address,
    this.gender,
    this.dateOfBirth,
    this.roles,
    this.businessType,
    this.region,
    this.businessId,
  });

  factory BusinessUser.fromJson(Map<String, dynamic> json) => _$BusinessUserFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessUserToJson(this);
}
