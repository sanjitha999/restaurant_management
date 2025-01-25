part of 'restaurant_list_bloc.dart';

@immutable
abstract class RestaurantListEvent {}

class FetchBusinessData extends RestaurantListEvent {}

class FetchBusinessList extends RestaurantListEvent {
  final String? region;

  FetchBusinessList({required this.region});
}

class UploadBusinessImage extends RestaurantListEvent {
  final ImageSource imageSource;
  final String businessId;

  UploadBusinessImage({
    required this.imageSource,
    required this.businessId,
  });
}

class FetchBusinessImage extends RestaurantListEvent {
  final String businessId;
  final String imageId;

  FetchBusinessImage({
    required this.businessId,
    required this.imageId,
  });
}
