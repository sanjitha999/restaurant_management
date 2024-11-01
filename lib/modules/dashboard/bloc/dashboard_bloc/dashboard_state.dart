part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardContentState extends DashboardState {
  final List<BottomNavigationBarItem> bottomNavItems;
  final List<Widget> pages;

  DashboardContentState({required this.bottomNavItems, required this.pages});
}

class UnAuthorizedState extends DashboardState {}

