import 'package:flutter/material.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/font_consts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.icon,
    required this.label,
    this.loader,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.bgColor,
    this.textColor,
  }) : super(key: key);

  final IconData? icon;
  final String label;
  final Widget? loader;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? () {} : onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              color: bgColor ?? AppColors.primaryLight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isLoading)
                    // Use a fixed size for the loader
                    SizedBox(
                      width: 24, // Set width for loader
                      height: 24, // Set height for loader
                      child: _getLoader(),
                    )
                  else
                    Center(
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: FontSize.title,
                          color: textColor ?? AppColors.accent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getLoader() {
    return const CircularProgressIndicator(
      color: AppColors.white,
    );
  }
}
