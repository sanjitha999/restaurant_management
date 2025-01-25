import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  final List<ImageItem> images;

  ImageModel({required this.images});

  // From JSON factory method
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  // To JSON method
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}

@JsonSerializable()
class ImageItem {
  final String id;
  final String name;
  final String type;

  ImageItem({
    required this.id,
    required this.name,
    required this.type,
  });

  // From JSON factory method
  factory ImageItem.fromJson(Map<String, dynamic> json) =>
      _$ImageItemFromJson(json);

  // To JSON method
  Map<String, dynamic> toJson() => _$ImageItemToJson(this);
}
