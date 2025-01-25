import 'package:resturant_management/modules/menu_list_screen/model/menu_list_response.dart';

class MenuItemDisplayModel {
  final String itemName;
  final double rating;
  final double price;
  final String description;
  final List<dynamic> imageDataList;
  final String menuType;
  final String itemId;
  final String quantity;
  final String ingredients;
  final String itemType;
  final bool isAvailable;

  MenuItemDisplayModel({
    required this.itemName,
    required this.rating,
    required this.price,
    required this.description,
    required this.imageDataList,
    required this.menuType,
    required this.itemId,
    required this.itemType,
    required this.isAvailable,
    required this.ingredients,
    required this.quantity,
  });

  // Factory constructor to create a MenuItemModel from a MenuItem
  factory MenuItemDisplayModel.fromMenuItem(MenuItem menuItem) {
    return MenuItemDisplayModel(
      itemName: menuItem.name,
      rating: menuItem.menutype == "VEG" ? 4.5 : 4.0,
      // Example rating logic based on menutype
      price: menuItem.price,
      description: menuItem.description,
      imageDataList: menuItem.images ?? [],
      // Assuming images are URLs
      menuType: menuItem.menutype,
      itemId: menuItem.id,
      itemType: menuItem.itemType,
      isAvailable: menuItem.isAvailable,
      quantity: menuItem.quantity,
      ingredients: menuItem.ingredients,
    );
  }
}

// Veg or Non veg symbol
// Item name
// rating
// Price
// Description
// image
