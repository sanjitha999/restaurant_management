part of 'first_level_check_bloc.dart';

@immutable
abstract class FirstLevelCheckState {}

class FirstLevelCheckInitial extends FirstLevelCheckState {}

class ContentState extends FirstLevelCheckState {
  final bool kitchenHygiene;
  final bool ac;
  final bool purifiedWater;
  final String seatCap;
  final String carParkingCap;
  final String restroomCap;
  final String restaurantCleanliness;
  final String ambiance;
  final List<String> seatsList;
  final List<String> carParkList;
  final List<String> restroomList;
  final List<String> cleanlinessList;
  final List<String> ambianceList;

  ContentState({
    required this.kitchenHygiene,
    required this.ac,
    required this.purifiedWater,
    required this.seatCap,
    required this.carParkingCap,
    required this.restroomCap,
    required this.restaurantCleanliness,
    required this.ambiance,
    required this.seatsList,
    required this.carParkList,
    required this.restroomList,
    required this.cleanlinessList,
    required this.ambianceList,
  });

  ContentState copyWith({
    bool? kitchenHygiene,
    bool? ac,
    bool? purifiedWater,
    String? seatCap,
    String? carParkingCap,
    String? restroomCap,
    String? restaurantCleanliness,
    String? ambiance,
    List<String>? seatsList,
    List<String>? carParkList,
    List<String>? restroomList,
    List<String>? cleanlinessList,
    List<String>? ambianceList,
  }) {
    return ContentState(
      kitchenHygiene: kitchenHygiene ?? this.kitchenHygiene,
      ac: ac ?? this.ac,
      purifiedWater: purifiedWater ?? this.purifiedWater,
      seatCap: seatCap ?? this.seatCap,
      carParkingCap: carParkingCap ?? this.carParkingCap,
      restroomCap: restroomCap ?? this.restroomCap,
      restaurantCleanliness:
          restaurantCleanliness ?? this.restaurantCleanliness,
      ambiance: ambiance ?? this.ambiance,
      seatsList: seatsList ?? this.seatsList,
      carParkList: carParkList ?? this.carParkList,
      restroomList: restroomList ?? this.restroomList,
      cleanlinessList: cleanlinessList ?? this.cleanlinessList,
      ambianceList: ambianceList ?? this.ambianceList,
    );
  }
}

class FirstLevelApprovalSubmitState extends FirstLevelCheckState {
  final String businessId;

  FirstLevelApprovalSubmitState({required this.businessId});
}

class LoadingState extends FirstLevelCheckState {}
