import 'package:flutter/material.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/font_consts.dart';

class TextStyleConst {
  static TextStyle heading = const TextStyle(
    fontSize: FontSize.size32,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headerDesc = const TextStyle(
    fontSize: FontSize.normal,
  );

  static TextStyle title = const TextStyle(
    fontSize: FontSize.title,
    fontWeight: FontWeight.bold,
  );

  static TextStyle semiBoldText = const TextStyle(
    fontSize: FontSize.normal,
    fontWeight: FontWeight.w500,
  );

  static TextStyle subtitle = const TextStyle(
    fontSize: FontSize.subtitle,
    fontWeight: FontWeight.w600,
    color: AppColors.textGrey,
  );

  static TextStyle body = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}
