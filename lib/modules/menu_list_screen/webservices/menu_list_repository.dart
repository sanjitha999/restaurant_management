import 'package:flutter/services.dart';
import 'package:resturant_management/modules/menu_list_screen/model/menu_item_model.dart';
import 'package:resturant_management/modules/menu_list_screen/webservices/menu_list_request.dart';

abstract class MenuListRepository {
  Future<List<MenuItemDisplayModel>?> getMenuList({required String businessId});

  Future<Uint8List?> getMenuItemImage({
    required String menuId,
    required String businessId,
    required String imageId,
  });
}

class MenuListRepoImpl implements MenuListRepository {
  final MenuListRequest _request = MenuListRequest();

  @override
  Future<List<MenuItemDisplayModel>?> getMenuList(
      {required String businessId}) {
    return _request.getMenuList(businessId: businessId);
  }

  @override
  Future<Uint8List?> getMenuItemImage({
    required String menuId,
    required String businessId,
    required String imageId,
  }) {
    return _request.getMenuItemImage(
      menuId: menuId,
      businessId: businessId,
      imageId: imageId,
    );
  }
}
