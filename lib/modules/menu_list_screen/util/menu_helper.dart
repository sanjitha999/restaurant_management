import 'package:resturant_management/modules/menu_list_screen/model/menu_item_model.dart';
import 'package:resturant_management/modules/menu_list_screen/model/menu_list_response.dart';

class MenuHelper {
  List<MenuItemDisplayModel> getMenuItemModels(MenuItemList menuItemList) {
    List<MenuItemDisplayModel> menuItemModels = [];
    for (var category in menuItemList.categories) {
      for (var subcategory in category.subcategories) {
        for (var item in subcategory.itemList) {
          menuItemModels.add(MenuItemDisplayModel.fromMenuItem(item));
        }
      }
    }
    return menuItemModels;
  }
}
