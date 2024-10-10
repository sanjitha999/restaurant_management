import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/modules/splash/bloc/splash_bloc.dart';
import 'package:resturant_management/navigation/routes.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/spacing.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        print("MyTest :: state $state");
        if (state is LoginState) {
          Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.background,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.mode_of_travel_sharp,
                    // Icons.travel_explore,
                    // Icons.fastfood_sharp,
                    size: 60,
                    weight: 20,
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBoxSpacing.width4,
              const Text(
                'RVay',
                style: TextStyle(
                  fontSize: 60, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                  color: AppColors.background,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
