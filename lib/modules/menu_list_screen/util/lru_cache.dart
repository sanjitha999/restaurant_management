import 'dart:typed_data';
import 'dart:collection';
import 'package:flutter/material.dart';

class LRUImageCache {
  final int maxSize;
  final LinkedHashMap<String, Uint8List> _cache;

  LRUImageCache({this.maxSize = 12}) : _cache = LinkedHashMap<String, Uint8List>();

  // Fetch image by key
  Uint8List? get(String key) {
    if (_cache.containsKey(key)) {
      _moveToEnd(key);
      return _cache[key];
    }
    return null;
  }

  // Add image to cache
  void put(String key, Uint8List image) {
    if (_cache.length >= maxSize) {
      _cache.remove(_cache.keys.first);
    }
    _cache[key] = image;
  }

  // Check if the cache contains the given key
  bool containsKey(String key) {
    return _cache.containsKey(key);
  }

  // Get all items in the cache
  Map<String, Uint8List> getAll() {
    return Map<String, Uint8List>.from(_cache);
  }

  // Remove an image from the cache
  void remove(String key) {
    _cache.remove(key);
  }

  // Clear the cache
  void clear() {
    _cache.clear();
  }

  // Move accessed item to the end (most recently used)
  void _moveToEnd(String key) {
    final value = _cache.remove(key);
    if (value != null) {
      _cache[key] = value;
    }
  }

  // Get current cache size
  int get size => _cache.length;
}



