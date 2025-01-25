// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemModel _$MenuItemModelFromJson(Map<String, dynamic> json) =>
    MenuItemModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      ingredients: json['ingredients'] as String?,
      menutype: json['menutype'] as String?,
      category: json['category'] as String?,
      subcategory: json['subcategory'] as String?,
      quantity: json['quantity'] as String?,
      price: (json['price'] as num?)?.toInt(),
      itemType: json['itemType'] as String?,
      isAvailable: json['isAvailable'] as bool?,
    );

Map<String, dynamic> _$MenuItemModelToJson(MenuItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'menutype': instance.menutype,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'quantity': instance.quantity,
      'price': instance.price,
      'itemType': instance.itemType,
      'isAvailable': instance.isAvailable,
    };
