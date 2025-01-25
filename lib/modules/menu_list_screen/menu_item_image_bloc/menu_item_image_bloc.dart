import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/modules/menu_list_screen/util/lru_cache.dart';
import 'package:resturant_management/modules/menu_list_screen/webservices/menu_list_repository.dart';

part 'menu_item_image_event.dart';

part 'menu_item_image_state.dart';

class MenuItemImageBloc extends Bloc<MenuItemImageEvent, MenuItemImageState> {
  final MenuListRepository repository;
  final String businessId;

  MenuItemImageBloc({
    required this.repository,
    required this.businessId,
  }) : super(MenuItemImageInitial()) {
    on<MenuItemImageFetch>(_fetchImage);
  }

  final LRUImageCache imageCache = LRUImageCache();

  FutureOr<void> _fetchImage(
    MenuItemImageFetch event,
    Emitter<MenuItemImageState> emit,
  ) async {
    final cachedImage = imageCache.get(event.menuId);
    if (cachedImage != null) {
    } else {
      final Uint8List? image = await repository.getMenuItemImage(
        businessId: businessId,
        menuId: event.menuId,
        imageId: event.menuId,
      );
      if (image != null) {
        imageCache.put(event.menuId, image); // Store the image in cache
      }
    }
  }
}
