part of 'restaurant_list_bloc.dart';

@immutable
abstract class RestaurantListState extends Equatable{}

class RestaurantListLoadingState extends RestaurantListState {
  @override
  List<Object?> get props => [];
}

class BusinessListDisplayState extends RestaurantListState {
  final List<BusinessItem> approvedList;
  final List<BusinessItem> pendingList;
  final List<BusinessItem> onboardedList;

  BusinessListDisplayState({
    required this.approvedList,
    required this.pendingList,
    required this.onboardedList,
  });

  @override
  List<Object?> get props => [approvedList, pendingList, onboardedList];
}

class BusinessRegionState extends RestaurantListState {
  final List<String> regionList;

  BusinessRegionState({required this.regionList});

  @override
  List<Object?> get props => [regionList];
}

class BusinessImagesState extends RestaurantListState {
  final BusinessImageCache? cachedImages;
  final String? id;

  BusinessImagesState({
    required this.cachedImages,
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [cachedImages,id];

  // @override
  // bool operator ==(Object other) => false;
}
