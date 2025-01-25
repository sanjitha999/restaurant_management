import 'dart:io';

import 'package:resturant_management/modules/menu_item_addition/model/add_menu_item_response_model.dart';
import 'package:resturant_management/modules/menu_item_addition/model/menu_item_model.dart';
import 'package:resturant_management/modules/menu_item_addition/webservice/menu_item_request.dart';

abstract class MenuItemRepository {
  Future<AddMenuItemResponseModel?> addMenuItem({
    required MenuItemModel menuItem,
    required String businessId,
  });

  Future<void> uploadMenuItemImage({
    required String businessId,
    required String menuId,
    required File imageFile,
  });
}

class MenuItemRepoImpl implements MenuItemRepository {
  final MenuItemRequest _request = MenuItemRequest();

  @override
  Future<AddMenuItemResponseModel?> addMenuItem({
    required MenuItemModel menuItem,
    required String businessId,
  }) {
    return _request.addMenuItem(
      menuItem: menuItem,
      businessId: businessId,
    );
  }

  @override
  Future<void> uploadMenuItemImage({
    required String businessId,
    required String menuId,
    required File imageFile,
  }) {
    return _request.uploadMenuItemImage(
      businessId: businessId,
      menuId: menuId,
      imageFile: imageFile,
    );
  }
}
