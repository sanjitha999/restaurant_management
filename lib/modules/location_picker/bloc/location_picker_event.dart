part of 'location_picker_bloc.dart';

@immutable
abstract class LocationPickerEvent {}

class LocationTextSubmit extends LocationPickerEvent {}

class LocationMarkingDone extends LocationPickerEvent {}
