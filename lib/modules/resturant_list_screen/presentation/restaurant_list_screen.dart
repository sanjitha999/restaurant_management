import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/custom_widgets/app_floating_button.dart';
import 'package:resturant_management/modules/resturant_list_screen/bloc/restaurant_list_bloc.dart';
import 'package:resturant_management/modules/resturant_list_screen/model/business_item.dart';
import 'package:resturant_management/modules/resturant_list_screen/presentation/components/regions_drop_down.dart';
import 'package:resturant_management/modules/resturant_list_screen/presentation/components/restaurant_list_widget.dart';
import 'package:resturant_management/navigation/routes.dart';
import 'package:resturant_management/theme/spacing.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        actions: [
          SizedBoxSpacing.width20,
          _regionsDropDown(),
          SizedBoxSpacing.width20,
        ],
      ),
      body: BlocConsumer<RestaurantListBloc, RestaurantListState>(
        buildWhen: (previous, current) =>
            current is BusinessListDisplayState ||
            current is RestaurantListLoadingState ||
            current is BusinessRegionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is BusinessListDisplayState) {
            return DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 10,
                  bottom: TabBar(tabs: _getTabs()),
                ),
                body: TabBarView(
                  children: _getTabBodies(
                    pendingList: state.pendingList,
                    approvedList: state.approvedList,
                    onboardedList: state.onboardedList,
                    bloc: BlocProvider.of<RestaurantListBloc>(context),
                  ),
                ),
                floatingActionButton: _buildOnboardRestaurantButton(context),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<Widget> _getTabs() {
    return [
      const Tab(
        text: "APPROVED",
        icon: Icon(Icons.done),
      ),
      const Tab(
        text: "PENDING",
        icon: Icon(Icons.access_time_filled),
      ),
      const Tab(
        text: "Onboarded",
        icon: Icon(Icons.home),
      ),
    ];
  }

  List<Widget> _getTabBodies({
    required List<BusinessItem> approvedList,
    required List<BusinessItem> pendingList,
    required List<BusinessItem> onboardedList,
    required RestaurantListBloc bloc,
  }) {
    return [
      RestaurantListWidget(
        restaurantList: approvedList,
        isApproved: true,
      ),
      RestaurantListWidget(
        restaurantList: pendingList,
        isApproved: false,
      ),
      RestaurantListWidget(
        restaurantList: onboardedList,
        isApproved: true,
      ),
    ];
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

  Widget _regionsDropDown() {
    return const RegionsDropDown();
  }
}
