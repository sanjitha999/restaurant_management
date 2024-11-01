import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/modules/first_level_check/bloc/first_level_check_bloc.dart';
import 'package:resturant_management/modules/first_level_check/model/first_level_request_model.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class FacilitiesWidget extends StatelessWidget {
  const FacilitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstLevelCheckBloc, FirstLevelCheckState>(
      buildWhen: (previous, current) => current is ContentState,
      builder: (context, state) {
        if (state is ContentState) {
          return Column(
            children: [
              _buildCheckListComponent(
                value: state.kitchenHygiene,
                title: CheckListTitles.kitchenHygiene.title,
                onChanged: (val) =>
                    BlocProvider.of<FirstLevelCheckBloc>(context).add(
                  UpdateKitchenHygiene(isChecked: val ?? false),
                ),
              ),
              _buildCheckListComponent(
                value: state.ac,
                title: CheckListTitles.ac.title,
                onChanged: (val) =>
                    BlocProvider.of<FirstLevelCheckBloc>(context).add(
                  UpdateAc(isChecked: val ?? false),
                ),
              ),
              _buildCheckListComponent(
                value: state.purifiedWater,
                title: CheckListTitles.purifiedWater.title,
                onChanged: (val) =>
                    BlocProvider.of<FirstLevelCheckBloc>(context).add(
                  UpdatePurifiedWater(isChecked: val ?? false),
                ),
              ),
              _buildDropDownComponent(
                title: CheckListTitles.seatCap.title,
                value: state.seatCap,
                choices: state.seatsList,
                onSelected: (val) =>
                    BlocProvider.of<FirstLevelCheckBloc>(context).add(
                  UpdateSeatCapacity(seatCapacity: val ?? ''),
                ),
              ),
              _buildDropDownComponent(
                title: CheckListTitles.cleanliness.title,
                value: state.restaurantCleanliness,
                choices: state.cleanlinessList,
                onSelected: (val) =>
                    BlocProvider.of<FirstLevelCheckBloc>(context).add(
                  UpdateRestaurantCleanliness(cleanliness: val ?? ''),
                ),
              ),
              _buildDropDownComponent(
                title: CheckListTitles.carParkCap.title,
                value: state.carParkingCap,
                choices: state.carParkList,
                onSelected: (val) =>
                    BlocProvider.of<FirstLevelCheckBloc>(context).add(
                  UpdateCarParkingCapacity(parkingCap: val ?? ''),
                ),
              ),
              _buildDropDownComponent(
                title: CheckListTitles.restroomCap.title,
                value: state.restroomCap,
                choices: state.restroomList,
                onSelected: (val) =>
                    BlocProvider.of<FirstLevelCheckBloc>(context).add(
                  UpdateRestRoomCapacity(restroomCap: val ?? ''),
                ),
              ),
              _buildDropDownComponent(
                title: CheckListTitles.ambiance.title,
                value: state.ambiance,
                choices: state.ambianceList,
                onSelected: (val) =>
                    BlocProvider.of<FirstLevelCheckBloc>(context).add(
                  UpdateAmbiance(ambiance: val ?? ''),
                ),
              ),
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget _buildCheckListComponent({
    required bool value,
    required String title,
    required void Function(bool?) onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyleConst.title,
        ),
        SizedBoxSpacing.width5,
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildDropDownComponent({
    required String value,
    required String title,
    required List<String> choices,
    required void Function(String?) onSelected,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyleConst.title,
        ),
        SizedBoxSpacing.width5,
        DropdownButton<String>(
          elevation: 5,
          value: value,
          items: choices.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
          onChanged: onSelected,
        ),
      ],
    );
  }
}
