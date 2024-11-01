import 'package:json_annotation/json_annotation.dart';

part 'submit_restaurant_response_model.g.dart'; // This file will be generated

@JsonSerializable()
class OnBoardBusinessResponse {
  final String code;
  final String id;
  final String message;

  OnBoardBusinessResponse({
    required this.code,
    required this.id,
    required this.message,
  });

  factory OnBoardBusinessResponse.fromJson(Map<String, dynamic> json) =>
      _$OnBoardBusinessResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OnBoardBusinessResponseToJson(this);
}

@JsonSerializable()
class SubmitRestaurantResponse {
  @JsonKey(name: 'OnBoardBusinessResponse')
  final OnBoardBusinessResponse onBoardBusinessResponse;

  SubmitRestaurantResponse({required this.onBoardBusinessResponse});

  factory SubmitRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitRestaurantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitRestaurantResponseToJson(this);
}
