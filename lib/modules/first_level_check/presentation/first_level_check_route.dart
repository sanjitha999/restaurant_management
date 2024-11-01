import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/custom_widgets/primary_button.dart';
import 'package:resturant_management/generated/l10n.dart';
import 'package:resturant_management/modules/first_level_check/bloc/first_level_check_bloc.dart';
import 'package:resturant_management/modules/first_level_check/presentation/facilities_widget.dart';
import 'package:resturant_management/navigation/routes.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class FirstLevelCheckRoute extends StatelessWidget {
  const FirstLevelCheckRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBoxSpacing.height26,
                _buildApprovalBody(context),
                SizedBoxSpacing.height72,
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _proceedButton(),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      Strings.of(context).amenities,
      style: TextStyleConst.heading,
    );
  }

  Widget _buildApprovalBody(BuildContext context) {
    return BlocProvider<FirstLevelCheckBloc>.value(
      value: BlocProvider.of<FirstLevelCheckBloc>(context),
      child: const FacilitiesWidget(),
    );
  }

  Widget _proceedButton() {
    return BlocConsumer<FirstLevelCheckBloc, FirstLevelCheckState>(
      listener: (context, state) {
        if (state is FirstLevelApprovalSubmitState) {
          Navigator.of(context).pushReplacementNamed(
            Routes.businessOverviewRoute,
            arguments: state.businessId,
          );
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          padding: const EdgeInsets.all(
            Spacing.largeMargin,
          ),
          child: PrimaryButton(
            label: Strings.of(context).submit,
            isLoading: (state is LoadingState),
            onPressed: () {
              BlocProvider.of<FirstLevelCheckBloc>(context)
                  .add(SubmitFirstLevelCheck());
            },
          ),
        );
      },
    );
  }
}
