import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/modules/resturant_list_screen/bloc/restaurant_list_bloc.dart';
import 'package:resturant_management/modules/resturant_list_screen/model/business_item.dart';
import 'package:resturant_management/modules/resturant_list_screen/presentation/components/restaurant_card_widget.dart';

class RestaurantListWidget extends StatelessWidget {
  const RestaurantListWidget({
    super.key,
    required this.restaurantList,
    required this.isApproved,
  });

  final List<BusinessItem> restaurantList;
  final bool isApproved;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
       debugPrint("MyTest :: onRefresh");
        BlocProvider.of<RestaurantListBloc>(context)
            .add(FetchBusinessList(region: null));

        await Future.delayed(const Duration(seconds: 2));
      },
      child: ListView.builder(
        prototypeItem: const RestaurantCardWidget(
          address: '',
          restaurantName: '',
          businessId: '',
          isApproved: true,
          imageId: '',
        ),
        itemBuilder: (context, index) {
          final BusinessItem restaurant = restaurantList[index];
          String? imageId;
          if( restaurant.images?.isNotEmpty ?? false){
            imageId = restaurant.images?[0].id;
          }
          // BlocProvider.of<RestaurantListBloc>(context).add(FetchBusinessImage(
          //     businessId: restaurant.id ?? '',
          //     imageId: restaurant.images?[0].id ?? ''));
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: RestaurantCardWidget(
              restaurantName: restaurant.name ?? '',
              address: restaurant.address?.line1 ?? '',
              businessId: restaurant.id ?? '',
              isApproved: isApproved,
              imageId: imageId ?? '',
            ),
          );
        },
        itemCount: restaurantList.length,
      ),
    );
  }
}
