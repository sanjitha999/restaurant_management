import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resturant_management/custom_widgets/primary_button.dart';
import 'package:resturant_management/generated/l10n.dart';
import 'package:resturant_management/modules/restaurant_associate_onboard/bloc/restaurant_associate_onboard_bloc.dart';
import 'package:resturant_management/modules/restaurant_associate_onboard/presentation/component/restaurant_associate_onboard_form.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class RestaurantAssociateOnboardScreen extends StatelessWidget {
  const RestaurantAssociateOnboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(context),
              _buildSubtitle(context),
              SizedBoxSpacing.height26,
              _buildAdminDetailsForm(),
              SizedBoxSpacing.height72,
            ],
          ),
        ),
      ),
      bottomSheet: _proceedButton(),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      "Restaurant Associate Onboarding",
      style: TextStyleConst.heading,
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      "Fill in the associate details",
      style: TextStyleConst.headerDesc,
    );
  }

  Widget _buildAdminDetailsForm() {
    return const RestaurantAssociateOnboardForm();
  }

  Widget _proceedButton() {
    return BlocConsumer<RestaurantAssociateOnboardBloc, RestaurantAssociateOnboardState>(
      listener: (context, state) {
        if (state is DetailsSubmittedState) {
          BuildContext curCtx = context;
          Fluttertoast.showToast(msg: state.message ?? '').then(
                (_) {
              if (curCtx.mounted) {
                Navigator.of(context).pop();
              }
            },
          );
        }
      },
      builder: (context, state) {
        bool showButton = false;
        if (state is ContentState) {
          showButton = state.showButton ?? false;
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
                label: Strings.of(context).submit,
                onPressed: () {
                  BlocProvider.of<RestaurantAssociateOnboardBloc>(context)
                      .add(SubmitDetails());
                },
              ),
            ],
          ),
        )
            : const SizedBox.shrink();
      },
    );
  }
}

