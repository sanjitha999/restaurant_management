import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/modules/dashboard/models/master_data_model.dart';
import 'package:resturant_management/modules/resturant_list_screen/caching/business_image_cache.dart';
import 'package:resturant_management/modules/resturant_list_screen/model/business_item.dart';
import 'package:resturant_management/modules/resturant_list_screen/webservice/restaurant_list_repository.dart';
import 'package:resturant_management/session/session_manager.dart';

part 'restaurant_list_event.dart';

part 'restaurant_list_state.dart';

// class RestaurantListBloc extends Bloc<RestaurantListEvent, RestaurantListState> {
//   final RestaurantListRepository repository;
//
//   RestaurantListBloc({required this.repository})
//       : super(RestaurantListLoadingState()) {
//     on<FetchBusinessData>(_fetchBusinessData);
//     on<FetchBusinessList>(_fetchRegionWiseBusinessList);
//     on<UploadBusinessImage>(_uploadBusinessImage);
//     on<FetchBusinessImage>(_fetchBusinessImage);
//   }
//
//   List<String>? regionList;
//   File? _imageFile;
//   final ImagePicker _picker = ImagePicker();
//   BusinessImageCache? businessImageCache;
//
//   FutureOr<void> _fetchBusinessData(
//       FetchBusinessData event,
//       Emitter<RestaurantListState> emit,
//       ) async {
//     try {
//       final MasterDataModel? masterDataModel =
//       await SessionManager().getMasterData();
//       regionList = masterDataModel?.regions;
//      debugPrint("MyTEst State is emitted now");
//       emit(BusinessRegionState(
//         regionList: regionList ?? [],
//       ));
//       add(FetchBusinessList(region: regionList?[0] ?? ''));
//     } catch (e) {
//      debugPrint("MyTEst :: error fetching $e");
//     }
//   }
//
//   Future<void> _fetchRegionWiseBusinessList(
//       FetchBusinessList event,
//       Emitter<RestaurantListState> emit,
//       ) async {
//     try {
//       final String region = event.region;
//
//       // Fetch the list of restaurants
//       final List<BusinessItem>? restaurantList = await repository.getRestaurantList(region: region);
//
//       if (restaurantList == null || restaurantList.isEmpty) {
//         // Handle empty or null restaurant list
//         emit(BusinessListDisplayState(
//           approvedList: [],
//           pendingList: [],
//           onboardedList: [],
//         ));
//         return;
//       }
//
//       // Separate the restaurant list into pending, approved, and onboarded lists
//       final List<BusinessItem>? pendingList = restaurantList
//           ?.where((res) => res.approvalStatus == ApprovalStatus.pending.val)
//           .toList();
//
//       final List<BusinessItem>? approvedItems = restaurantList
//           ?.where((res) => res.approvalStatus == ApprovalStatus.approved.val)
//           .toList();
//
//       final List<BusinessItem>? onboardedList = approvedItems
//           ?.where((res) => res.secondLevelApprovalStatus == ApprovalStatus.approved.val)
//           .toList();
//
//       final List<BusinessItem>? approvedList = approvedItems
//           ?.where((res) => res.secondLevelApprovalStatus != ApprovalStatus.approved.val)
//           .toList();
//
//       // Fetch images for all restaurants concurrently using `Future.wait`
//       await Future.wait(restaurantList.map((restaurant) {
//         return _fetchBusinessImageForRestaurant(restaurant);
//       }));
//
//       // Emit the final state after images are fetched
//       emit(
//         BusinessListDisplayState(
//           approvedList: approvedList ?? [],
//           pendingList: pendingList ?? [],
//           onboardedList: onboardedList ?? [],
//         ),
//       );
//     } catch (e) {
//      debugPrint("MyTest :: error fetching data: $e");
//     }
//   }
//
//   // Fetch image for each restaurant and cache it
//   Future<void> _fetchBusinessImageForRestaurant(BusinessItem restaurant) async {
//     try {
//       final imageId = restaurant.images?.first.id;
//       if (imageId == null) return;
//
//       // Ensure businessImageCache exists before use
//       businessImageCache ??= BusinessImageCache();
//
//       // Only fetch if image is not already cached
//       final imageKey = '${restaurant.id}_image_${imageId}';
//       if (businessImageCache?.getImage(imageKey) == null) {
//         final cachedImages = await repository.fetchBusinessImage(
//           businessId: restaurant.id ?? '',
//           imageId: imageId,
//         );
//         if (cachedImages != null) {
//           businessImageCache?.updateImage(imageKey, cachedImages.getImage(imageKey) ?? Uint8List(0));
//         }
//       }
//     } catch (e) {
//      debugPrint("MyTest :: error fetching image for ${restaurant.id}: $e");
//     }
//   }
//
//   FutureOr<void> _uploadBusinessImage(
//       UploadBusinessImage event,
//       Emitter<RestaurantListState> emit,
//       ) async {
//     await _pickImage(event.imageSource);
//     try {
//       await repository.uploadBusinessImage(
//         businessId: event.businessId,
//         imageFile: _imageFile ?? File(""),
//       );
//     } catch (e) {
//      debugPrint("MyTest :: error uploading image $e");
//     }
//   }
//
//   Future<void> _pickImage(ImageSource source) async {
//     final XFile? image = await _picker.pickImage(source: source);
//     if (image != null) {
//       _imageFile = File(image.path);
//     }
//   }
//
//   Future<void> _fetchBusinessImage(
//       FetchBusinessImage event,
//       Emitter<RestaurantListState> emit,
//       ) async {
//    debugPrint(
//         "MyTest :: cur image id ${event.imageId} and res id ${event.businessId}");
//     try {
//      debugPrint("MyTest :: businessImage fetching");
//       // final BusinessImageCache? cachedImages =
//       await repository
//           .fetchBusinessImage(
//         businessId: event.businessId ?? '',
//         imageId: event.imageId,
//       )
//           .then(
//             (cachedImages) {
//          debugPrint("MyTest :: cached Images here ${cachedImages}");
//           businessImageCache = cachedImages;
//           emit(
//             BusinessImagesState(
//               cachedImages: cachedImages,
//               id: '${event.businessId}_image_${event.imageId}',
//             ),
//           );
//         },
//       );
//
//      debugPrint("MyTEst :: cur emitting state DONE");
//     } catch (e) {
//      debugPrint("MyTest :: businessImage fetch exception");
//      debugPrint("MyTEst :: error fetching image");
//     }
//   }
// }


class RestaurantListBloc
    extends Bloc<RestaurantListEvent, RestaurantListState> {
  final RestaurantListRepository repository;

  RestaurantListBloc({required this.repository})
      : super(RestaurantListLoadingState()) {
    on<FetchBusinessData>(_fetchBusinessData);
    on<FetchBusinessList>(_fetchRegionWiseBusinessList);
    on<UploadBusinessImage>(_uploadBusinessImage);
    on<FetchBusinessImage>(_fetchBusinessImage);
  }

  List<String>? regionList;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  BusinessImageCache? businessImageCache;
  String? curRegion;

  FutureOr<void> _fetchBusinessData(
    FetchBusinessData event,
    Emitter<RestaurantListState> emit,
  ) async {
    try {
      final MasterDataModel? masterDataModel =
          await SessionManager().getMasterData();
      regionList = masterDataModel?.regions;
      emit(BusinessRegionState(
        regionList: regionList ?? [],
      ));
      curRegion = regionList?[0];
      add(FetchBusinessList(region: curRegion ?? ''));
      
    } catch (e) {
     debugPrint("MyTEst :: error fetching $e");
    }
  }

  Future<void> _fetchRegionWiseBusinessList(
    FetchBusinessList event,
    Emitter<RestaurantListState> emit,
  ) async {
    try {
      final String region = event.region ?? curRegion ?? '';
      final List<BusinessItem>? restaurantList =
          await repository.getRestaurantList(region: region);
      final List<BusinessItem>? pendingList = restaurantList
          ?.where(
            (res) => res.approvalStatus == ApprovalStatus.pending.val,
          )
          .toList();

      final List<BusinessItem>? approvedItems = restaurantList
          ?.where(
            (res) => res.approvalStatus == ApprovalStatus.approved.val,
          )
          .toList();
      final List<BusinessItem>? onboardedList = approvedItems
          ?.where((res) =>
              res.secondLevelApprovalStatus == ApprovalStatus.approved.val)
          .toList();
      final List<BusinessItem>? approvedList = approvedItems
          ?.where((res) =>
              res.secondLevelApprovalStatus != ApprovalStatus.approved.val)
          .toList();
      emit(
        BusinessListDisplayState(
          approvedList: approvedList ?? [],
          pendingList: pendingList ?? [],
          onboardedList: onboardedList ?? [],
        ),
      );
    } catch (e) {
     debugPrint("MyTEst :: error fetching data");
    }
  }

  FutureOr<void> _uploadBusinessImage(
    UploadBusinessImage event,
    Emitter<RestaurantListState> emit,
  ) async {
    await _pickImage(event.imageSource);
    try {
      await repository.uploadBusinessImage(
        businessId: event.businessId,
        imageFile: _imageFile ?? File(""),
      );
    } catch (e) {
     debugPrint("MyTest :: error uploading image $e");
    }
    // emit((state as MenuContentState).copyWith(
    //   showButton: _isFormValid(),
    //   image: _imageFile,
    // ));
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      _imageFile = File(image.path);
    }
  }

  Future<void> _fetchBusinessImage(
    FetchBusinessImage event,
    Emitter<RestaurantListState> emit,
  ) async {
    try {
      // final BusinessImageCache? cachedImages =
      /// HERE
      await repository
          .fetchBusinessImage(
        businessId: event.businessId ?? '',
        imageId: event.imageId,
      )
          .then(
        (cachedImages) {
          businessImageCache = cachedImages;
          emit(
            BusinessImagesState(
              cachedImages: cachedImages,
              id: '${event.businessId}_image_${event.imageId}',
            ),
          );
        },
      );

      /// HERE
      // var image =
      //     cachedImages?.getImage('${event.businessId}_image_${event.imageId}');
      // if (image != null) {
      //  debugPrint("MyTest :: businessImage fetched  is NOT Null");
      // } else {
      //  debugPrint("MyTest :: businessImage fetched is NULL");
      //  debugPrint("MyTEst :: cached Image is Null");
      // }
      //debugPrint("MyTEst :: cur emitting state");
    } catch (e) {
     debugPrint("MyTest :: businessImage fetch exception $e");
    }
  }
}
