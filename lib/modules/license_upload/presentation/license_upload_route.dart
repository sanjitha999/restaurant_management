import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/custom_widgets/primary_button.dart';
import 'package:resturant_management/generated/l10n.dart';
import 'package:resturant_management/modules/license_upload/bloc/license_upload_bloc.dart';
import 'package:resturant_management/modules/license_upload/model/license_item_model.dart';
import 'package:resturant_management/modules/license_upload/presentation/license_upload_widget.dart';
import 'package:resturant_management/navigation/routes.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class LicenseUploadRoute extends StatelessWidget {
  const LicenseUploadRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: BlocConsumer<LicenseUploadBloc, LicenseUploadState>(
          buildWhen: (previous, current) =>
              current is LicenseListFetchedState ||
              current is LicenseFetchLoading,
          listenWhen: (previous, current) => current is NoLicensesState,
          listener: (context, state) {
            if (state is NoLicensesState) {
              //TODO(R Deekshitha): Take to next screen
            }
          },
          builder: (context, state) {
            if (state is LicenseListFetchedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTitle(context),
                  _buildSubtitle(context),
                  SizedBoxSpacing.height24,
                  Expanded(child: _buildLicenseUploadWidget(state.licenses)),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomSheet: _proceedButton(),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      Strings.of(context).licenseTitle,
      style: TextStyleConst.heading,
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      Strings.of(context).licenseDesc,
      style: TextStyleConst.headerDesc,
    );
  }

  Widget _buildLicenseUploadWidget(List<LicenseItemModel> licenses) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return LicenseUploadWidget(
          isUploaded: licenses[index].isLicenseUploaded,
          license: licenses[index].licenseCertificate,
          onTextChange: (text) {
            BlocProvider.of<LicenseUploadBloc>(context).add(LicenseIdInput(
              index: index,
              text: text,
            ));
          },
          onTap: () {
            BlocProvider.of<LicenseUploadBloc>(context)
                .add(UploadLicenseEvent(index: index));
          },
        );
      },
      itemCount: licenses.length,
    );
  }

  Widget _proceedButton() {
    return BlocConsumer<LicenseUploadBloc, LicenseUploadState>(
      listener: (context, state) {
        if (state is LicenseSubmittedState) {
          Navigator.of(context).pushReplacementNamed(
            Routes.firstLevelCheckRoute,
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
            isLoading: (state is LicenseUploadLoading),
            onPressed: () {
              BlocProvider.of<LicenseUploadBloc>(context)
                  .add(UploadAllDocuments());
            },
          ),
        );
      },
    );
  }
}
