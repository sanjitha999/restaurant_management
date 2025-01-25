import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/custom_widgets/app_floating_button.dart';
import 'package:resturant_management/modules/admins_list_screen/presentation/admin_user_details_screen.dart';
import 'package:resturant_management/modules/admins_list_screen/presentation/components/user_tile.dart';
import 'package:resturant_management/modules/restaurant_associates/bloc/restaurant_associates_bloc.dart';
import 'package:resturant_management/navigation/routes.dart';

class RestaurantAssociatesScreen extends StatelessWidget {
  final String businessId;

  const RestaurantAssociatesScreen({
    super.key,
    required this.businessId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RestaurantAssociatesBloc, RestaurantAssociatesState>(
        buildWhen: (previous, current) =>
            current is RestaurantAssociatesDisplayState ||
            current is RestaurantAssociatesLoading,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is RestaurantAssociatesDisplayState) {
            if (state.associatesList.isNotEmpty) {
              return ListView.builder(
                itemCount: state.associatesList.length,
                itemBuilder: (context, index) {
                  final user = state.associatesList[index];
                  return BusinessUserTile(
                    user: user,
                    onTap: () {
                      //Push details screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailsScreen(user: user),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: Text('Restaurant Associate List'),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: _buildOnboardAdminButton(context),
    );
  }

  Widget _buildOnboardAdminButton(BuildContext context) {
    return AppFloatingButton(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.restaurantAssociatesRoute,
          arguments: businessId,
        );
      },
      text: "Associate",
      icon: CupertinoIcons.add,
    );
  }
}
