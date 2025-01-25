part of 'res_nav_bar_bloc.dart';

@immutable
abstract class ResNavBarEvent {
  const ResNavBarEvent();
}

class MenuTabTapEvent extends ResNavBarEvent {
  const MenuTabTapEvent();
}

class OperatorsTabTapEvent extends ResNavBarEvent {
  const OperatorsTabTapEvent();
}

class ProfileTabTapEvent extends ResNavBarEvent {
  const ProfileTabTapEvent();
}
