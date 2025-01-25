import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/modules/admins_list_screen/models/business_user_models.dart';
import 'package:resturant_management/modules/restaurant_associates/webservice/restaurant_associates_repository.dart';

part 'restaurant_associates_event.dart';

part 'restaurant_associates_state.dart';

class RestaurantAssociatesBloc
    extends Bloc<RestaurantAssociatesEvent, RestaurantAssociatesState> {
  final RestaurantAssociatesRepository repository;

  RestaurantAssociatesBloc({required this.repository})
      : super(RestaurantAssociatesLoading()) {
    on<FetchAssociatesEvent>(_fetchAssociatesList);
  }

  FutureOr<void> _fetchAssociatesList(
    FetchAssociatesEvent event,
    Emitter<RestaurantAssociatesState> emit,
  ) async {
    try {
      final List<BusinessUser>? associatesList =
          await repository.getAssociatesList();
      //debugPrint("MyTest :: associatesList ${associatesList?[0].toJson()} ");
      emit(RestaurantAssociatesDisplayState(
          associatesList: associatesList ?? []));
    } catch (e) {
     debugPrint("MyTest :: fetch admin error $e");
    }
  }
}
