import 'package:json_annotation/json_annotation.dart';

part 'menu_list_response.g.dart';

@JsonSerializable()
class MenuListResponse {
  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'businessId')
  final String businessId;

  @JsonKey(name: 'menuItemList')
  final MenuItemList menuItemList;

  @JsonKey(name: 'message')
  final String message;

  MenuListResponse({
    required this.code,
    required this.businessId,
    required this.menuItemList,
    required this.message,
  });

  factory MenuListResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenuListResponseToJson(this);
}

@JsonSerializable()
class MenuItemList {
  @JsonKey(name: 'categories')
  final List<Category> categories;

  MenuItemList({required this.categories});

  factory MenuItemList.fromJson(Map<String, dynamic> json) =>
      _$MenuItemListFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemListToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'subcategories')
  final List<Subcategory> subcategories;

  Category({required this.name, required this.subcategories});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Subcategory {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'itemList')
  final List<MenuItem> itemList;

  Subcategory({required this.name, required this.itemList});

  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
}

@JsonSerializable()
class MenuItem {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'ingredients')
  final String ingredients;

  @JsonKey(name: 'menutype')
  final String menutype;

  @JsonKey(name: 'category')
  final String category;

  @JsonKey(name: 'subcategory')
  final String subcategory;

  @JsonKey(name: 'quantity')
  final String quantity;

  @JsonKey(name: 'isHalfPlateEnabled')
  final bool? isHalfPlateEnabled;

  @JsonKey(name: 'halfPlateQuantity')
  final String? halfPlateQuantity;

  @JsonKey(name: 'halfPlateDescription')
  final String? halfPlateDescription;

  @JsonKey(name: 'halfPlatePrice')
  final double halfPlatePrice;

  @JsonKey(name: 'price')
  final double price;

  @JsonKey(name: 'itemType')
  final String itemType;

  @JsonKey(name: 'isAvailable')
  final bool isAvailable;

  @JsonKey(name: 'images')
  final dynamic images;

  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.menutype,
    required this.category,
    required this.subcategory,
    required this.quantity,
    this.isHalfPlateEnabled,
    this.halfPlateQuantity,
    this.halfPlateDescription,
    required this.halfPlatePrice,
    required this.price,
    required this.itemType,
    required this.isAvailable,
    this.images,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}
