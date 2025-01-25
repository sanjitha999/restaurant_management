part of 'restaurant_associates_bloc.dart';

@immutable
abstract class RestaurantAssociatesState {}

class RestaurantAssociatesLoading extends RestaurantAssociatesState {}

class RestaurantAssociatesDisplayState extends RestaurantAssociatesState {
  final List<BusinessUser> associatesList;

  RestaurantAssociatesDisplayState({required this.associatesList});
}
