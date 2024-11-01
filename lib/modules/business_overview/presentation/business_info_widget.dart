import 'package:flutter/material.dart';
import 'package:resturant_management/modules/business_overview/model/business_info_model.dart';
import 'package:resturant_management/modules/business_overview/presentation/business_item_widget.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class BusinessInfoWidget extends StatelessWidget {
  const BusinessInfoWidget({super.key, required this.businessInfo});

  final BusinessInfoModel businessInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            Text(
              businessInfo.title,
              style: TextStyleConst.title,
            ),
            SizedBoxSpacing.height16,
            ...businessInfo.items.map(
              (businessItem) => Padding(
                padding: const EdgeInsets.symmetric(vertical:3),
                child: BusinessItemWidget(
                  infoItem: businessItem,
                ),
              ),
            ),
            // BusinessItemWidget(),
            // SizedBoxSpacing.height8,
            // BusinessItemWidget(),
            // SizedBoxSpacing.height8,
          ],
        ),
      ),
    );
  }
}
