part of 'menu_list_bloc.dart';

@immutable
abstract class MenuListEvent {}

class FetchMenuList extends MenuListEvent {}

class FetchItemImage extends MenuListEvent {
  final String menuId;
  final String imageId;

  FetchItemImage({
    required this.menuId,
    required this.imageId,
  });
}

class ShowDetailsEvent extends MenuListEvent {
  final String menuId;
  final String imageId;

  ShowDetailsEvent({
    required this.menuId,
    required this.imageId,
  });
}
