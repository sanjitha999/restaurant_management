import 'package:flutter/material.dart';
import 'package:resturant_management/modules/login/presentation/components/login_card.dart';
import 'package:resturant_management/theme/app_colors.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accent,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 2,
            decoration: const BoxDecoration(
              color: AppColors.primaryLight,
            ),
            child: Image(image: image),
          ),
          const Center(
            child: LoginCardWidget(),
          )
        ],
      ),
    );
  }
}
