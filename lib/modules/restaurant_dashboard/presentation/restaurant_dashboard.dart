import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/modules/business_overview/bloc/business_overview_bloc.dart';
import 'package:resturant_management/modules/business_overview/presentation/business_overview_route.dart';
import 'package:resturant_management/modules/business_overview/webservices/business_overview_repository.dart';
import 'package:resturant_management/modules/menu_list_screen/bloc/menu_list_bloc.dart';
import 'package:resturant_management/modules/menu_list_screen/presentation/menu_list_screen.dart';
import 'package:resturant_management/modules/menu_list_screen/webservices/menu_list_repository.dart';
import 'package:resturant_management/modules/restaurant_associates/bloc/restaurant_associates_bloc.dart';
import 'package:resturant_management/modules/restaurant_associates/presentation/restaurant_associates_screen.dart';
import 'package:resturant_management/modules/restaurant_associates/webservice/restaurant_associates_repository.dart';
import 'package:resturant_management/modules/restaurant_dashboard/bloc/res_nav_bar_bloc/res_nav_bar_bloc.dart';
import 'package:resturant_management/modules/restaurant_dashboard/presentation/restaurant_bottom_nav_bar/restaurant_nav_bar.dart';

class RestaurantDashboard extends StatefulWidget {
  final String businessId;

  const RestaurantDashboard({super.key, required this.businessId});

  @override
  State<RestaurantDashboard> createState() => _RestaurantDashboardState();
}

class _RestaurantDashboardState extends State<RestaurantDashboard> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<ResNavBarBloc, ResNavBarState>(
        listener: (context, state) {
          int index = 0;
          if (state is ProfileTabTapState) index = 2;
          if (state is OperatorsTabTapState) index = 1;
          if (index != _tabIndex) {
            setState(() {
              _tabIndex = index;
            });
          }
        },
        child: IndexedStack(
          index: _tabIndex,
          children: [
            BlocProvider(
              create: (context) => MenuListBloc(
                repository: AppDI.inject<MenuListRepository>(),
                businessId: widget.businessId,
              )..add(FetchMenuList()),
              child: MenuListScreen(
                businessId: widget.businessId,
              ),
            ),
            BlocProvider(
              create: (context) => RestaurantAssociatesBloc(
                repository: AppDI.inject<RestaurantAssociatesRepository>(),
              )..add(FetchAssociatesEvent()),
              child: RestaurantAssociatesScreen(
                businessId: widget.businessId,
              ),
            ),
            BlocProvider(
              create: (context) => BusinessOverviewBloc(
                repository: AppDI.inject<BusinessOverviewRepository>(),
                businessId: widget.businessId,
              )..add(FetchBusinessOverviewEvent()),
              child: const BusinessOverviewRoute(
                isPendingPage: false,
                showAppBar: false,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RestaurantNavBar(
        callback: _onNavBarSwitch,
        index: _tabIndex,
      ),
    );
  }

  void _onNavBarSwitch(int index) {
    switch (index) {
      case 0:
        BlocProvider.of<ResNavBarBloc>(context).add(const MenuTabTapEvent());
        break;
      case 1:
        BlocProvider.of<ResNavBarBloc>(context)
            .add(const OperatorsTabTapEvent());
        break;
      case 2:
        BlocProvider.of<ResNavBarBloc>(context).add(const ProfileTabTapEvent());
        break;
    }
  }
}
