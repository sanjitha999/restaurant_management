import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/modules/dashboard/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:resturant_management/modules/dashboard/presentation/bottom_nav_bar_widget.dart';
import 'package:resturant_management/navigation/routes.dart';

class DashboardRoute extends StatelessWidget {
  const DashboardRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is UnAuthorizedState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.loginRoute,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is DashboardContentState) {
          return Scaffold(
            appBar: AppBar(
              leading: const SizedBox(),
            ),
            body: getBodyBasedOnSelectedNav(
              bottomNavItems: state.bottomNavItems,
              pages: state.pages,
            ),
            bottomNavigationBar: BottomNavBarWidget(
              bottomNavItems: state.bottomNavItems,
              pages: state.pages,
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget getBodyBasedOnSelectedNav(
      {required List<Widget> pages,
      required List<BottomNavigationBarItem> bottomNavItems}) {
    return BottomNavBarWidget(
      bottomNavItems: bottomNavItems,
      pages: pages,
    ).getPageForNav();
  }
}
