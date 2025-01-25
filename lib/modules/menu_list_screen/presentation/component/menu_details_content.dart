import 'package:flutter/material.dart';
import 'package:resturant_management/modules/menu_list_screen/model/menu_item_model.dart';
import 'package:resturant_management/modules/menu_list_screen/presentation/component/rating_component.dart';
import 'package:resturant_management/modules/menu_list_screen/presentation/component/veg_non_veg_indicator_widget.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/font_consts.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';
import 'package:resturant_management/utils/string_utils.dart';

class MenuDetailsContent extends StatelessWidget {
  final MenuItemDisplayModel menuItem;

  const MenuDetailsContent({
    super.key,
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _itemNameAndTypeComp(),
          _ratingComp(),
          _priceComp(),
          Flexible(child: _descriptionComp()),
        ],
      ),
    );
  }

  Widget _vegOrNonIndicatorComp() {
    return VegNonVegIndicatorWidget(
      menuType: menuItem.menuType,
    );
  }

  Widget _itemNameAndTypeComp() {
    return Row(
      children: [
        Expanded(
            child: Text(
          menuItem.itemName ?? '',
          style: TextStyleConst.title,
        )),
        _vegOrNonIndicatorComp(),
      ],
    );
  }

  Widget _ratingComp() {
    return const RatingComponent();
  }

  Widget _priceComp() {
    return Text(
      currencyFormatWithSpace(menuItem.price),
      style: TextStyleConst.title,
    );
  }

  Widget _descriptionComp() {
    return Text(
      softWrap: true,
      menuItem.description ?? '',
    );
  }
}
