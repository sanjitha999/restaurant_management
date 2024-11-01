import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'location_picker_event.dart';
part 'location_picker_state.dart';

class LocationPickerBloc extends Bloc<LocationPickerEvent, LocationPickerState> {
  LocationPickerBloc() : super(LocationPickerInitial()) {
    on<LocationPickerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
