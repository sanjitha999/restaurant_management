import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resturant_management/custom_widgets/primary_button.dart';
import 'package:resturant_management/generated/l10n.dart';
import 'package:resturant_management/modules/menu_item_addition/bloc/menu_item_add_bloc.dart';
import 'package:resturant_management/modules/menu_item_addition/presentation/menu_form.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class MenuItemAddRoute extends StatelessWidget {
  const MenuItemAddRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(context),
              SizedBoxSpacing.height26,
              _buildMenuForm(context),
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
      Strings.of(context).fillInTheMenuDetails,
      style: TextStyleConst.heading,
    );
  }

  Widget _buildMenuForm(BuildContext ctx) {
    return BlocProvider.value(
      value: BlocProvider.of<MenuItemAddBloc>(ctx),
      child: MenuForm(),
    );
  }

  Widget _proceedButton() {
    return BlocConsumer<MenuItemAddBloc, MenuItemAddState>(
      buildWhen: (previous, current) =>
          current is MenuContentState || current is LoadingState,
      listenWhen: (previous, current) =>
          current is SuccessState || current is ExceptionState,
      listener: (context, state) {
        if (state is SuccessState) {
          BuildContext curCtx = context;
          Fluttertoast.showToast(msg: state.message).then(
            (_) {
              if (curCtx.mounted) {
                Navigator.of(context).pop();
              }
            },
          );
        } else if (state is ExceptionState) {
          BuildContext curCtx = context;
          Fluttertoast.showToast(msg: state.message).then(
            (_) {
              if (curCtx.mounted) {
                Navigator.of(context).pop();
              }
            },
          );
        }
      },
      builder: (context, state) {
        if (state is MenuContentState && state.showButton) {
          return Container(
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
                    BlocProvider.of<MenuItemAddBloc>(context)
                        .add(SubmitMenuDetails());
                  },
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
