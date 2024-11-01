import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/modules/dashboard/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';

class BottomNavBarWidget extends StatelessWidget {
  BottomNavBarWidget(
      {super.key, required this.pages, required this.bottomNavItems});

  final List<Widget> pages;
  final List<BottomNavigationBarItem> bottomNavItems;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      buildWhen: (previous, current) =>
          current is BottomNavInitialState || current is BottomNavSelectedState,
      builder: (context, state) {
        if (state is BottomNavSelectedState) {
          _selectedIndex = state.selectedIndex;
        }
        return BottomNavigationBar(
          currentIndex: _selectedIndex, // The selected tab index
          onTap: (index) {
            BlocProvider.of<BottomNavBloc>(context).add(
              UpdateNavSelectionEvent(selectedIndex: index),
            );
          }, // Update the selected tab
          items: bottomNavItems,
        );
      },
    );
  }

  Widget getPageForNav() {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        if (state is BottomNavSelectedState) {
          _selectedIndex = state.selectedIndex;
        }
        return pages[_selectedIndex];
      },
    );
  }
}
