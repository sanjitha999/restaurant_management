import 'package:flutter/material.dart';
import 'app_colors.dart'; // Import your colors class

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary, // Yellow for primary
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary, // Yellow
      secondary: AppColors.accent, // Black (formerly accent)
      surface: AppColors.surface, // White for surfaces
      background: AppColors.background, // Off-white
      onPrimary: AppColors.surface, // Widgets on primary color
      onSecondary: AppColors.surface, // Widgets on secondary color
      onSurface: AppColors.accent, // Widgets on surface color
      onBackground: AppColors.accent, // Widgets on background color
    ),
    scaffoldBackgroundColor: AppColors.background, // Off-white background
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary, // Yellow app bar
      iconTheme: IconThemeData(color: AppColors.accent), // Black icons
      titleTextStyle: TextStyle(
        color: AppColors.accent, // Black title text
        fontSize: 20, // Font size for the title
        fontWeight: FontWeight.bold, // Bold font
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary, // Yellow button color
      textTheme: ButtonTextTheme.primary, // Primary text color
    ),
    // textTheme: TextTheme(
    //   bodyText1: TextStyle(color: AppColors.accent), // Black text
    //   bodyText2: TextStyle(color: AppColors.accent), // Black text
    //   headline1: TextStyle(color: AppColors.accent), // Black headline
    //   button: TextStyle(color: AppColors.surface), // White button text
    // ),
  );
}
