import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturant_management/custom_widgets/app_floating_button.dart';
import 'package:resturant_management/navigation/routes.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("RESTAURANT LIST"),
      ),
      floatingActionButton: _buildOnboardRestaurantButton(context),
    );
  }

  Widget _buildOnboardRestaurantButton(BuildContext context) {
    return AppFloatingButton(
      onTap: () => Navigator.of(context).pushNamed(
        Routes.restaurantOnboardingRoute,
      ),
      text: "Restaurant",
      icon: CupertinoIcons.add,
    );
  }
}
