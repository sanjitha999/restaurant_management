part of 'location_picker_bloc.dart';

@immutable
abstract class LocationPickerState {}

class LocationPickerInitial extends LocationPickerState {}

class UpdateMarkerPosition extends LocationPickerState {}
