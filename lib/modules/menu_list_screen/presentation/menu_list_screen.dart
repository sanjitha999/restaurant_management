import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/custom_widgets/app_floating_button.dart';
import 'package:resturant_management/modules/menu_list_screen/bloc/menu_list_bloc.dart';
import 'package:resturant_management/modules/menu_list_screen/presentation/component/menu_list_widget.dart';
import 'package:resturant_management/navigation/routes.dart';
import 'package:resturant_management/theme/spacing.dart';

class MenuListScreen extends StatelessWidget {
  final String businessId;

  const MenuListScreen({
    super.key,
    required this.businessId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MenuListBloc, MenuListState>(
        buildWhen: (previous, current) =>
            current is MenuListDisplayState || current is MenuListLoadingState,
        builder: (context, state) {
          if (state is MenuListDisplayState) {
            return MenuListWidget(
              menuList: state.menuList ?? [],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: _buildOnboardRestaurantButton(context),
    );
  }

  Widget _buildOnboardRestaurantButton(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppFloatingButton(
          onTap: () => Navigator.of(context).pushNamed(
            Routes.menuItemAddRoute,
            arguments: businessId,
          ),
          text: "Menu",
          icon: CupertinoIcons.add,
        ),
        SizedBoxSpacing.height10,
        AppFloatingButton(
          onTap: () => Navigator.of(context).pushNamed(
            Routes.menuApprovalRoute,
            arguments: businessId,
          ),
          text: "Approve",
          icon: CupertinoIcons.location_fill,
        ),
      ],
    );
  }
}
