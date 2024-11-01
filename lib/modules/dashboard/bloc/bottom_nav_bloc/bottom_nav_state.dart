part of 'bottom_nav_bloc.dart';

@immutable
abstract class BottomNavState {}

class BottomNavSelectedState extends BottomNavState {
  final int selectedIndex;

  BottomNavSelectedState({required this.selectedIndex});
}

class UnAuthorizedState extends BottomNavState {}

class BottomNavInitialState extends BottomNavState {
  final List<BottomNavigationBarItem> bottomNavItems;
  final List<Widget> pages;

  BottomNavInitialState({
    required this.bottomNavItems,
    required this.pages,
  });
}
