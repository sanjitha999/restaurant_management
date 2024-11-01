part of 'first_level_check_bloc.dart';

@immutable
abstract class FirstLevelCheckEvent {}

class FetchCheckDataEvent extends FirstLevelCheckEvent {}

class UpdateKitchenHygiene extends FirstLevelCheckEvent {
  final bool isChecked;

  UpdateKitchenHygiene({required this.isChecked});
}

class UpdateAc extends FirstLevelCheckEvent {
  final bool isChecked;

  UpdateAc({required this.isChecked});
}

class UpdatePurifiedWater extends FirstLevelCheckEvent {
  final bool isChecked;

  UpdatePurifiedWater({required this.isChecked});
}

class UpdateSeatCapacity extends FirstLevelCheckEvent {
  final String seatCapacity;

  UpdateSeatCapacity({required this.seatCapacity});
}

class UpdateCarParkingCapacity extends FirstLevelCheckEvent {
  final String parkingCap;

  UpdateCarParkingCapacity({required this.parkingCap});
}

class UpdateRestRoomCapacity extends FirstLevelCheckEvent {
  final String restroomCap;

  UpdateRestRoomCapacity({required this.restroomCap});
}

class UpdateRestaurantCleanliness extends FirstLevelCheckEvent {
  final String cleanliness;

  UpdateRestaurantCleanliness({required this.cleanliness});
}

class UpdateAmbiance extends FirstLevelCheckEvent {
  final String ambiance;

  UpdateAmbiance({required this.ambiance});
}

class SubmitFirstLevelCheck extends FirstLevelCheckEvent {}
