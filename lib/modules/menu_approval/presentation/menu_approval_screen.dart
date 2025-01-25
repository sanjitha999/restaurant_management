import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resturant_management/custom_widgets/primary_button.dart';
import 'package:resturant_management/modules/menu_approval/bloc/menu_approval_bloc.dart';
import 'package:resturant_management/modules/menu_approval/presentation/component/menu_check_list_builder_widget.dart';
import 'package:resturant_management/theme/spacing.dart';

class MenuApprovalScreen extends StatelessWidget {
  final String businessID;

  const MenuApprovalScreen({super.key, required this.businessID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Quality Check"),
      ),
      body: BlocConsumer<MenuApprovalBloc, MenuApprovalState>(
        buildWhen: (previous, current) =>
            current is MenuCheckListContent || current is MenuApprovalLoading,
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
          if (state is MenuCheckListContent) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBoxSpacing.height20,
                  MenuCheckListBuilderWidget(
                    itemsModel: state.checkListContent[0],
                  ),
                  SizedBoxSpacing.height30,
                  MenuCheckListBuilderWidget(
                    itemsModel: state.checkListContent[1],
                  ),
                  const Spacer(),
                  PrimaryButton(
                    label: "Submit",
                    onPressed: () => BlocProvider.of<MenuApprovalBloc>(context)
                        .add(SubmitApprovalEvent()),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
