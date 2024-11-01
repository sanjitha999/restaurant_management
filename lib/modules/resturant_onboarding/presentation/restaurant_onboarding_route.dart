import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/custom_widgets/primary_button.dart';
import 'package:resturant_management/generated/l10n.dart';
import 'package:resturant_management/modules/resturant_onboarding/bloc/restaurant_onboarding_bloc.dart';
import 'package:resturant_management/modules/resturant_onboarding/presentation/restaurant_owner_details_route.dart';
import 'package:resturant_management/modules/resturant_onboarding/presentation/resturant_info_form.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class RestaurantOnboardingRoute extends StatelessWidget {
  const RestaurantOnboardingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitle(context),
                _buildSubtitle(context),
                SizedBoxSpacing.height26,
                _buildRestaurantDetailsForm(),
                SizedBoxSpacing.height72,
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _proceedButton(),
    );
  }

  Widget _proceedButton() {
    return BlocBuilder<RestaurantOnboardingBloc, RestaurantOnboardingState>(
      builder: (context, state) {
        bool showButton = false;
        if (state is RestaurantContentState) {
          showButton = state.showRestaurantButton ?? false;
        }
        return showButton
            ? Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                ),
                padding: const EdgeInsets.all(
                  Spacing.largeMargin,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PrimaryButton(
                      label: Strings.of(context).proceed,
                      onPressed: () {
                        // Push the next screen wrapped with this bloc
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: BlocProvider.of<RestaurantOnboardingBloc>(
                                  context),
                              child: const RestaurantOwnerDetailsRoute(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      Strings.of(context).restaurantDetails,
      style: TextStyleConst.heading,
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      Strings.of(context).fillInTheBelow,
      style: TextStyleConst.headerDesc,
    );
  }

  Widget _buildRestaurantDetailsForm() {
    return const RestaurantInfoForm();
  }
}
