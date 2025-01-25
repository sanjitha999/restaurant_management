import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/modules/resturant_list_screen/bloc/restaurant_list_bloc.dart';
import 'package:resturant_management/theme/app_colors.dart';

class RegionsDropDown extends StatefulWidget {
  const RegionsDropDown({super.key});

  @override
  State<RegionsDropDown> createState() => _RegionsDropDownState();
}

class _RegionsDropDownState extends State<RegionsDropDown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantListBloc, RestaurantListState>(
      buildWhen: (previous, current) => current is BusinessRegionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is BusinessRegionState) {
          return DropdownButton<String>(
            icon: const Icon(
              Icons.place_outlined,
              color: AppColors.accent,
              size: 30,
            ),
            iconSize: 30,
            value: _selectedItem,
            hint: const Text("Select Region"),
            items: state.regionList.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              BlocProvider.of<RestaurantListBloc>(context).add(FetchBusinessList(region: newValue ?? ''));
              setState(() {
                _selectedItem = newValue;
              });
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
