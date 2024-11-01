import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:resturant_management/generated/l10n.dart';
import 'package:resturant_management/modules/resturant_onboarding/bloc/restaurant_onboarding_bloc.dart';
import 'package:resturant_management/navigation/routes.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class RestaurantInfoForm extends StatefulWidget {
  const RestaurantInfoForm({super.key});

  @override
  State<RestaurantInfoForm> createState() => _RestaurantInfoFormState();
}

class _RestaurantInfoFormState extends State<RestaurantInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNoController.dispose();
    _locationController.dispose();
    _districtController.dispose();
    _stateController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantOnboardingBloc, RestaurantOnboardingState>(
      builder: (context, state) {
        if (state is RestaurantContentState) {
          _locationController.text =
              '${state.addressModel?.line1 ?? ""} ${state.addressModel?.line2 ?? ''}';
          _districtController.text = state.addressModel?.district ?? '';
          _stateController.text = state.addressModel?.state ?? '';
          _pincodeController.text = state.addressModel?.pincode ?? '';
          print("MyTest :: show button ${state.showRestaurantButton}");
        }
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: Strings.of(context).restaurantNane,
                ),
                onChanged: (name) {
                  BlocProvider.of<RestaurantOnboardingBloc>(context)
                      .add(OnRestaurantNameInput(name: name));
                },
              ),
              SizedBoxSpacing.height24,
              TextFormField(
                controller: _phoneNoController,
                onChanged: (number) {
                  BlocProvider.of<RestaurantOnboardingBloc>(context)
                      .add(OnRestaurantNoInput(number: number));
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                  LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                ],
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: Strings.of(context).restaurantPhoneNo,
                ),
              ),
              SizedBoxSpacing.height24,
              TextFormField(
                controller: _locationController,
                readOnly: true,
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(Routes.locationPickerRoute)
                      .then(
                    (value) {
                      if (value != null) {
                        if (mounted) {
                          BlocProvider.of<RestaurantOnboardingBloc>(context)
                              .add(
                            OnLocationPicked(latLng: value as LatLng),
                          );
                        }
                      }
                    },
                  );
                },
                enabled: true,
                decoration: InputDecoration(
                  labelText: Strings.of(context).location,
                  suffixIcon: const Icon(
                    Icons.location_pin,
                  ),
                ),
              ),
              Text(
                Strings.of(context).pickLocation,
                style: TextStyleConst.subtitle,
              ),
              SizedBoxSpacing.height24,
              TextFormField(
                controller: _districtController,
                enabled: false,
                readOnly: true,
                decoration: InputDecoration(labelText: "District"),
              ),
              SizedBoxSpacing.height24,
              TextFormField(
                controller: _stateController,
                enabled: false,
                readOnly: true,
                decoration: InputDecoration(labelText: "State"),
              ),
              SizedBoxSpacing.height24,
              TextFormField(
                controller: _pincodeController,
                enabled: false,
                readOnly: true,
                decoration: InputDecoration(labelText: "PinCode"),
              ),
            ],
          ),
        );
      },
    );
  }
}
