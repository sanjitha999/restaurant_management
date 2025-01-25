import 'dart:async';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/modules/menu_list_screen/model/menu_item_model.dart';
import 'package:resturant_management/modules/menu_list_screen/util/lru_cache.dart';
import 'package:resturant_management/modules/menu_list_screen/webservices/menu_list_repository.dart';

part 'menu_list_event.dart';

part 'menu_list_state.dart';

class MenuListBloc extends Bloc<MenuListEvent, MenuListState> {
  final MenuListRepository repository;
  final String businessId;

  MenuListBloc({
    required this.repository,
    required this.businessId,
  }) : super(MenuListLoadingState()) {
    on<FetchMenuList>(_onFetchMenuList);
    on<FetchItemImage>(_onFetchItemImage);
    on<ShowDetailsEvent>(_onShowDetailsEvent);
  }

  final LRUImageCache imageCache = LRUImageCache();

  Future<void> _onFetchMenuList(
    FetchMenuList event,
    Emitter<MenuListState> emit,
  ) async {
    try {
      List<MenuItemDisplayModel>? menuList =
          await repository.getMenuList(businessId: businessId);

      emit(
        MenuListDisplayState(
          menuList: menuList,
          businessId: businessId,
        ),
      );
    } catch (e) {
      emit(ExceptionState());
    }
  }

  Future<void> _onFetchItemImage(
    FetchItemImage event,
    Emitter<MenuListState> emit,
  ) async {
    final cachedImage = imageCache.get(event.menuId);
    if (cachedImage != null) {
    } else {
      final Uint8List? image = await repository.getMenuItemImage(
        businessId: businessId,
        menuId: event.menuId,
        imageId: event.imageId,
      );
      if (image != null) {
        imageCache.put(event.menuId, image); // Cache the extracted image
      }

      emit(MenuItemImageState(imageCacheList: imageCache));
    }
  }

  Uint8List? unzipAndExtractImage(Uint8List zipData) {
    try {
      // Decode the zip file
      final archive = ZipDecoder().decodeBytes(zipData);
      for (final file in archive.files) {
        if (file.isFile) {
          // Check for image files (e.g., PNG, JPG)
          if (file.name.endsWith('.png') ||
              file.name.endsWith('.jpg') ||
              file.name.endsWith('.jpeg')) {
            return file.content as Uint8List; // Return the image data
          }
        }
      }
    } catch (e) {}

    // Return null if no image file is found
    return null;
  }

  String? getImageType(Uint8List imageBytes) {
    if (imageBytes.length < 4) return null; // Not enough data to determine type

    // Check PNG
    if (imageBytes[0] == 0x89 &&
        imageBytes[1] == 0x50 &&
        imageBytes[2] == 0x4E &&
        imageBytes[3] == 0x47) {
      return 'PNG';
    }

    // Check JPEG
    if (imageBytes[0] == 0xFF &&
        imageBytes[1] == 0xD8 &&
        imageBytes[2] == 0xFF) {
      return 'JPEG';
    }

    // Check GIF
    if (imageBytes[0] == 0x47 &&
        imageBytes[1] == 0x49 &&
        imageBytes[2] == 0x46 &&
        imageBytes[3] == 0x38) {
      return 'GIF';
    }

    // Check BMP
    if (imageBytes[0] == 0x42 && imageBytes[1] == 0x4D) {
      return 'BMP';
    }

    // Check WEBP
    if (imageBytes[0] == 0x52 &&
        imageBytes[1] == 0x49 &&
        imageBytes[2] == 0x46 &&
        imageBytes[3] == 0x46) {
      return 'WEBP';
    }

    // Unknown format
    return null;
  }

  FutureOr<void> _onShowDetailsEvent(
      ShowDetailsEvent event, Emitter<MenuListState> emit) async {
    add(FetchItemImage(
      menuId: event.menuId,
      imageId: event.imageId,
    ));
    final image = imageCache.get(event.menuId);
    emit(RouteToDetailsScreenState(
      image: image,
      menuId: event.menuId,
    ));
  }
}
