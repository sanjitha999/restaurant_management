import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/modules/menu_list_screen/bloc/menu_list_bloc.dart';
import 'package:resturant_management/modules/menu_list_screen/model/menu_item_model.dart';
import 'package:resturant_management/modules/menu_list_screen/presentation/component/menu_details_content.dart';
import 'package:resturant_management/navigation/routes.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/spacing.dart';

class MenuItemWidget extends StatelessWidget {
  final MenuItemDisplayModel menuItem;
  final String menuId;

  const MenuItemWidget({
    super.key,
    required this.menuItem,
    required this.menuId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MenuListBloc, MenuListState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is RouteToDetailsScreenState) {
          if (menuId == state.menuId) {
            Navigator.of(context).pushNamed(
              Routes.menuItemDetailsRoute,
              arguments: [menuItem, state.image],
            );
          }
        }
      },
      child: GestureDetector(
        onTap: () {
          // Navigator.of(context).pushNamed(
          //   Routes.menuItemDetailsRoute,
          //   arguments: [menuItem,null],
          // );
          BlocProvider.of<MenuListBloc>(context).add(ShowDetailsEvent(
            menuId: menuId,
            imageId: '',
          ));
        },
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(flex: 4, child: _buildItemDetails()),
              SizedBoxSpacing.width20,
              Expanded(flex: 2, child: _buildImage(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDetails() {
    return MenuDetailsContent(
      menuItem: menuItem,
    );
  }

  Widget _buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 8,
      ),
      child: AspectRatio(
        aspectRatio: 1, // Set aspect ratio as 1 to make it a square container
        child: BlocBuilder<MenuListBloc, MenuListState>(
          buildWhen: (previous, current) =>
              current is MenuItemImageState || current is MenuListLoadingState,
          builder: (context, state) {
            if (state is MenuItemImageState) {
              final image = state.imageCacheList.get(menuId);
              if (image != null) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius12),
                    color: AppColors.textGrey,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radius12),
                    child: Image.memory(
                      image,
                      fit:
                          BoxFit.cover, // Ensures the image fills the container
                    ),
                  ),
                );
              } else {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius12),
                    color: AppColors.textGrey,
                  ),
                  child: Icon(
                    Icons.image,
                    color: Colors.white70,
                    size: 50,
                  ),
                );
              }
            } else {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius12),
                  color: AppColors.textGrey,
                ),
                child: Icon(
                  Icons.image,
                  color: Colors.white70,
                  size: 50,
                ),
              );
            }
            // return Center(
            //   child: Image.memory(BlocProvider.of<MenuListBloc>(context)
            //       .imageCache
            //       .get(menuId)),
            //   // child: Icon(
            //   //   Icons.image,
            //   //   color: Colors.white70,
            //   //   size: 50,
            //   // ), // Placeholder icon for visual indication
            // );
          },
        ),
      ),
    );
  }
}
