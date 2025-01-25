import 'package:flutter/material.dart';
import 'package:resturant_management/modules/dashboard/utils/role_based_dashboard_util.dart';

class RestaurantNavBar extends StatelessWidget with RoleBasedDashboardUtil {
  const RestaurantNavBar({super.key, required this.callback, required this.index});
  final Function(int) callback;
  final int index;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      currentIndex: index,
      items: getRestaurantNavItems(),
      onTap: (index) {
        callback(index);
      },
    );
  }
}
