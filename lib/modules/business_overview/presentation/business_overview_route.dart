import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/custom_widgets/primary_button.dart';
import 'package:resturant_management/generated/l10n.dart';
import 'package:resturant_management/modules/business_overview/bloc/business_overview_bloc.dart';
import 'package:resturant_management/modules/business_overview/presentation/business_info_widget.dart';
import 'package:resturant_management/navigation/routes.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class BusinessOverviewRoute extends StatelessWidget {
  const BusinessOverviewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessOverviewBloc, BusinessOverviewState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: BlocBuilder<BusinessOverviewBloc, BusinessOverviewState>(
                buildWhen: (previous, current) => current is DataFetchedState,
                builder: (context, state) {
                  if (state is DataFetchedState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildTitle(context),
                        SizedBoxSpacing.height16,
                        ...state.infos.map(
                          (businessInfo) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: BusinessInfoWidget(
                              businessInfo: businessInfo,
                            ),
                          ),
                        ),
                        SizedBoxSpacing.height100,
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
          bottomSheet: _proceedButton(context),
        );
      },
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      Strings.of(context).overview,
      style: TextStyleConst.heading,
    );
  }

  Widget _proceedButton(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      padding: const EdgeInsets.all(
        Spacing.largeMargin,
      ),
      child: PrimaryButton(
        label: Strings.of(context).confirm,
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.dashboardRoute,
            (route) => false,
          );
        },
      ),
    );
  }
}
