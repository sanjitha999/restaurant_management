import 'package:flutter/material.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/font_consts.dart';
import 'package:resturant_management/theme/spacing.dart';

class RatingComponent extends StatelessWidget {
  const RatingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "4.5",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: FontSize.subtitle,
            ),
          ),
          SizedBoxSpacing.width2,
          Icon(
            Icons.star_rounded,
            size: 14,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
