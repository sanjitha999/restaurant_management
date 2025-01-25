// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuListResponse _$MenuListResponseFromJson(Map<String, dynamic> json) =>
    MenuListResponse(
      code: json['code'] as String,
      businessId: json['businessId'] as String,
      menuItemList:
          MenuItemList.fromJson(json['menuItemList'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$MenuListResponseToJson(MenuListResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'businessId': instance.businessId,
      'menuItemList': instance.menuItemList,
      'message': instance.message,
    };

MenuItemList _$MenuItemListFromJson(Map<String, dynamic> json) => MenuItemList(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuItemListToJson(MenuItemList instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      name: json['name'] as String,
      subcategories: (json['subcategories'] as List<dynamic>)
          .map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name': instance.name,
      'subcategories': instance.subcategories,
    };

Subcategory _$SubcategoryFromJson(Map<String, dynamic> json) => Subcategory(
      name: json['name'] as String,
      itemList: (json['itemList'] as List<dynamic>)
          .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubcategoryToJson(Subcategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'itemList': instance.itemList,
    };

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => MenuItem(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      ingredients: json['ingredients'] as String,
      menutype: json['menutype'] as String,
      category: json['category'] as String,
      subcategory: json['subcategory'] as String,
      quantity: json['quantity'] as String,
      isHalfPlateEnabled: json['isHalfPlateEnabled'] as bool?,
      halfPlateQuantity: json['halfPlateQuantity'] as String?,
      halfPlateDescription: json['halfPlateDescription'] as String?,
      halfPlatePrice: (json['halfPlatePrice'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      itemType: json['itemType'] as String,
      isAvailable: json['isAvailable'] as bool,
      images: json['images'],
    );

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'menutype': instance.menutype,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'quantity': instance.quantity,
      'isHalfPlateEnabled': instance.isHalfPlateEnabled,
      'halfPlateQuantity': instance.halfPlateQuantity,
      'halfPlateDescription': instance.halfPlateDescription,
      'halfPlatePrice': instance.halfPlatePrice,
      'price': instance.price,
      'itemType': instance.itemType,
      'isAvailable': instance.isAvailable,
      'images': instance.images,
    };
