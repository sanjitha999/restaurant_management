import 'package:flutter/material.dart';
import 'package:resturant_management/modules/resturant_list_screen/presentation/restaurant_list_screen.dart';
import 'package:resturant_management/utils/user_role_extension.dart';

mixin RoleBasedDashboardUtil {
  List<Widget> getPages(UserRole userRole) {
    List<Widget> pages = [];

    switch (userRole) {
      case UserRole.SUPERUSER:
        pages = [
          const RestaurantListScreen(),
          const Center(child: Text('Admin List')),
          const Center(child: Text('Profile')),
        ];
      case UserRole.ADMIN:
        pages = [
          const Center(child: Text('Restaurant List')),
          const Center(child: Text('Profile')),
        ];
      case UserRole.RESTAURANT_MANAGER:
        pages = [
          const Center(child: Text('Menu List')),
          const Center(child: Text('Orders List')),
          const Center(child: Text('Profile')),
        ];
      case UserRole.RESTAURANT_OWNER:
        pages = [
          const Center(child: Text('Menu List')),
          const Center(child: Text('Orders List')),
          const Center(child: Text('Profile')),
        ];
      case UserRole.CUSTOMER:
      // TODO: Handle this case.
    }
    return pages;
  }

  List<BottomNavigationBarItem> getBottomNavItems(UserRole userRole) {
    List<BottomNavigationBarItem> bottomNavItems = [];
    switch (userRole) {
      case UserRole.ADMIN:
        bottomNavItems = const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Restaurants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Profile',
          ),
        ];
      case UserRole.SUPERUSER:
        bottomNavItems = const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Restaurants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_rounded),
            label: 'Admins',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Profile',
          ),
        ];
      case UserRole.RESTAURANT_MANAGER:
        bottomNavItems = const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Profile',
          ),
        ];
      case UserRole.RESTAURANT_OWNER:
        bottomNavItems = const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Profile',
          ),
        ];
      case UserRole.CUSTOMER:
      // TODO: Handle this case.
    }
    return bottomNavItems;
  }
}
