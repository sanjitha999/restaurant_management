import 'package:json_annotation/json_annotation.dart';

part 'menu_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MenuItemModel {
  final String? name;
  final String? description;
  final String? ingredients;
  final String? menutype;
  final String? category;
  final String? subcategory;
  final String? quantity;
  final int? price;
  final String? itemType;
  final bool? isAvailable;

  MenuItemModel({
    this.name,
    this.description,
    this.ingredients,
    this.menutype,
    this.category,
    this.subcategory,
    this.quantity,
    this.price,
    this.itemType,
    this.isAvailable,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemModelToJson(this);

  Map<String, dynamic> wrapAsMenuItemRequest(MenuItemModel model) {
    return {
      'MenuItemRequest': model.toJson(),
    };
  }

}

enum MenuType {
  veg('VEG', "Veg"),
  nonVeg('NON_VEG', "Non Veg");

  final String val;
  final String displayText;

  const MenuType(this.val, this.displayText);
}
