import 'package:flutter/material.dart';
import 'package:resturant_management/modules/menu_item_addition/model/menu_item_model.dart';
import 'package:resturant_management/theme/app_colors.dart';

class VegNonVegIndicatorWidget extends StatelessWidget {
  final String menuType;
  const VegNonVegIndicatorWidget({super.key, required this.menuType});

  @override
  Widget build(BuildContext context) {
    Color color = menuType == MenuType.veg.val
        ? AppColors.successGreen
        : AppColors.errorColor;
    // Color color = AppColors.errorColor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          // Set the desired size for the square
          height: 20,
          // Same as width to make it a square
          decoration: BoxDecoration(
            shape: BoxShape.rectangle, // Ensures a square shape
            border: Border.all(
              color: color,
              width: 2.0, // Border thickness
            ),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.circle,
            color: color,
            size: 10, // Adjust size as needed
          ),
        ),
      ],
    );
  }
}
