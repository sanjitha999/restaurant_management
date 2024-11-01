import 'package:flutter/material.dart';
import 'package:resturant_management/modules/business_overview/model/business_info_item_model.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class BusinessItemWidget extends StatelessWidget {
  const BusinessItemWidget({
    super.key,
    required this.infoItem,
  });

  final BusinessInfoItemModel infoItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${infoItem.title}:",
          style: TextStyleConst.semiBoldText,
        ),
        SizedBoxSpacing.width10,
        Flexible(
          child: Text(
            infoItem.value,
            style: TextStyleConst.body,
          ),
        ),
      ],
    );
  }
}
