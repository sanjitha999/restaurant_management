part of 'menu_item_image_bloc.dart';

@immutable
abstract class MenuItemImageEvent {}

class MenuItemImageFetch extends MenuItemImageEvent {
  final String menuId;

  MenuItemImageFetch({required this.menuId});
}
