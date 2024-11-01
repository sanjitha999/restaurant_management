part of 'bottom_nav_bloc.dart';

@immutable
abstract class BottomNavEvent {}

class FetchInitialDataEvent extends BottomNavEvent {}

class UpdateNavSelectionEvent extends BottomNavEvent {
  final int selectedIndex;

  UpdateNavSelectionEvent({required this.selectedIndex});
}
