import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressModel {
  final String? line1;
  final String? line2;
  final String? landmark;
  final LocationModel? location;
  final String? pincode;
  final String? district;
  final String? state;
  final String? country;

  AddressModel({
    this.line1,
    this.line2,
    this.landmark,
    this.location,
    this.pincode,
    this.district,
    this.state,
    this.country,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}

@JsonSerializable()
class LocationModel {
  final double latitude;
  final double longitude;

  LocationModel({
    required this.latitude,
    required this.longitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
