import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/custom_widgets/app_floating_button.dart';
import 'package:resturant_management/modules/admins_list_screen/bloc/admins_list_bloc.dart';
import 'package:resturant_management/modules/admins_list_screen/presentation/admin_user_details_screen.dart';
import 'package:resturant_management/modules/admins_list_screen/presentation/components/user_tile.dart';
import 'package:resturant_management/navigation/routes.dart';

class AdminListScreen extends StatelessWidget {
  const AdminListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
      ),
      body: BlocConsumer<AdminsListBloc, AdminsListState>(
        buildWhen: (previous, current) =>
            current is AdminListDisplayState ||
            current is AdminsListLoadingState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AdminListDisplayState) {
            if (state.adminList.isNotEmpty) {
              return ListView.builder(
                itemCount: state.adminList.length,
                itemBuilder: (context, index) {
                  final user = state.adminList[index];
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
                child: Text('Admin List'),
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
        Navigator.of(context).pushNamed(Routes.adminOnboardingRoute);
      },
      text: "Admin",
      icon: CupertinoIcons.add,
    );
  }
}
