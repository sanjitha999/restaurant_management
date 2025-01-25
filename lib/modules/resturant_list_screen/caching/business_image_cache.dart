import 'package:flutter/services.dart';
import 'package:resturant_management/modules/menu_list_screen/util/lru_cache.dart';

class BusinessImageCache {
  final LRUImageCache _cache;

  BusinessImageCache({int maxSize = 50}) : _cache = LRUImageCache(maxSize: maxSize);

  Uint8List? getImage(String businessId) {
    return _cache.get(businessId);
  }

  void addImage(String businessId, Uint8List image) {
    _cache.put(businessId, image);
  }

  // Fetch all cached images as a Map
  Map<String, Uint8List> getAllImages() {
    return Map.from(_cache.getAll());
  }

  void updateImage(String businessId, Uint8List image) {
    _cache.put(businessId, image); // This will either add or update the image
  }
}
