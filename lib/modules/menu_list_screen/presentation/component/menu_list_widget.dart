import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/modules/menu_list_screen/bloc/menu_list_bloc.dart';
import 'package:resturant_management/modules/menu_list_screen/model/menu_item_model.dart';
import 'package:resturant_management/modules/menu_list_screen/presentation/component/menu_item_widget.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class MenuListWidget extends StatelessWidget {
  final List<MenuItemDisplayModel> menuList;

  const MenuListWidget({
    super.key,
    required this.menuList,
  });

  @override
  Widget build(BuildContext context) {
    if (menuList.isNotEmpty) {
      return RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<MenuListBloc>(context).add(FetchMenuList());
          await Future.delayed(const Duration(seconds: 2));
        },
        child: ListView.builder(
          itemCount: menuList.length,
          prototypeItem: MenuItemWidget(
            menuItem: menuList[0],
            menuId: '',
          ),
          itemBuilder: (context, index) {
            String? imageId;
            if (menuList[index].imageDataList.isNotEmpty) {
             debugPrint(
                  "MyTest :: menu image id ${menuList[index].imageDataList[0]['id'].toString()}");
              imageId = menuList[index].imageDataList[0]['id'] ?? '';
            }
            //TODO: Image event was called here
            BlocProvider.of<MenuListBloc>(context).add(FetchItemImage(
              menuId: menuList[index].itemId,
              imageId: imageId ?? '',
            ));
            return Padding(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: MenuItemWidget(
                menuItem: menuList[index],
                menuId: menuList[index].itemId,
              ),
            );
          },
        ),
      );
    } else {
      return Center(
        child: Text(
          "Start Adding Items",
          style: TextStyleConst.subtitle,
        ),
      );
    }
  }
}
