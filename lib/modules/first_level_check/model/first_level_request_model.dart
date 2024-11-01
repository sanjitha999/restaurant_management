import 'package:json_annotation/json_annotation.dart';

part 'first_level_request_model.g.dart';

@JsonSerializable()
class FirstLevelRequestModel {
  @JsonKey(name: 'ApprovalRequest')
  final ApprovalRequest approvalRequest;

  FirstLevelRequestModel({required this.approvalRequest});

  factory FirstLevelRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FirstLevelRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$FirstLevelRequestModelToJson(this);
}

@JsonSerializable()
class ApprovalRequest {
  final ApprovalData approvalData;

  ApprovalRequest({required this.approvalData});

  factory ApprovalRequest.fromJson(Map<String, dynamic> json) =>
      _$ApprovalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovalRequestToJson(this);
}

@JsonSerializable()
class ApprovalData {
  final String kitchenHygiene;
  @JsonKey(name: 'AC')
  final String ac;
  @JsonKey(name: 'PurifiedWater')
  final String purifiedWater;
  final String seatCapacity;
  final String carParkingCapacity;
  final String restRoomCapacity;
  final String restaurantCleanliness;
  final String ambiance;

  ApprovalData({
    required this.kitchenHygiene,
    required this.ac,
    required this.purifiedWater,
    required this.seatCapacity,
    required this.carParkingCapacity,
    required this.restRoomCapacity,
    required this.restaurantCleanliness,
    required this.ambiance,
  });

  factory ApprovalData.fromJson(Map<String, dynamic> json) =>
      _$ApprovalDataFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovalDataToJson(this);
}

enum CheckListTitles {
  kitchenHygiene(title: "Kitchen Hygiene"),
  ac(title: "Air Conditioning (A/C)"),
  purifiedWater(title: "Purified Water"),
  seatCap(title: "Seating Capacity"),
  carParkCap(title: "Car Parking Capacity"),
  restroomCap(title: "Restroom Cleanliness"),
  cleanliness(title: "Restaurant Cleanliness"),
  ambiance(title: "Restaurant Ambiance");

  final String title;

  const CheckListTitles({required this.title});
}
