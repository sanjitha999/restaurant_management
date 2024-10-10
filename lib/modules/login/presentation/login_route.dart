import 'package:flutter/material.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/spacing.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              color: AppColors.primaryLight,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: AppColors.surface,
                  // boxShadow: [
                  //   BoxShadow(
                  //     offset: Offset(0, 0),
                  //   spreadRadius: Dimensions.smallRadius,
                  //     blurRadius: Dimensions.smallRadius,
                  //     color: AppColors.shadowGrey,
                  //   ),
                  // ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
