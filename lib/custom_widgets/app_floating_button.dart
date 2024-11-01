import 'package:flutter/cupertino.dart';
import 'package:resturant_management/theme/app_colors.dart';

class AppFloatingButton extends StatelessWidget {
  const AppFloatingButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
  });

  final void Function() onTap;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          color: AppColors.primaryLight,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 16,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
