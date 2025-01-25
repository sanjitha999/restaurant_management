part of 'menu_list_bloc.dart';

@immutable
abstract class MenuListState {}

class MenuListLoadingState extends MenuListState {}

class MenuListDisplayState extends MenuListState {
  final List<MenuItemDisplayModel>? menuList;
  final String businessId;

  MenuListDisplayState({
    required this.menuList,
    required this.businessId,
  });
}

class MenuItemImageState extends MenuListState {
  final LRUImageCache imageCacheList;

  MenuItemImageState({required this.imageCacheList});
}

class RouteToDetailsScreenState extends MenuListState {
  final Uint8List? image;
  final String? menuId;
  RouteToDetailsScreenState({required this.image, required this.menuId});
}
class ExceptionState extends MenuListState {}
