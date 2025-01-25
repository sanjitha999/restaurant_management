import 'package:flutter/material.dart';
import 'package:resturant_management/modules/menu_approval/models/title_item_model.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class MenuCheckListBuilderWidget extends StatefulWidget {
  final TitleItemsModel itemsModel;

  const MenuCheckListBuilderWidget({super.key, required this.itemsModel});

  @override
  State<MenuCheckListBuilderWidget> createState() =>
      _MenuCheckListBuilderWidgetState();
}

class _MenuCheckListBuilderWidgetState
    extends State<MenuCheckListBuilderWidget> {
  // Map to store the checked state of each checkbox
  late Map<String, bool> _checkedItems;

  @override
  void initState() {
    super.initState();
    // Initialize the map with all items set to false
    _checkedItems = {
      for (var item in widget.itemsModel.items ?? []) item: false
    };
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.itemsModel.title,
            style: TextStyleConst.title,
          ),
          SizedBoxSpacing.height20,
          Flexible(
            child: _checkListItems(),
          ),
        ],
      ),
    );
  }

  Widget _checkListItems() {
    List<String> items = widget.itemsModel.items ?? [];
    return SingleChildScrollView(
      child: Column(
        children: items.map((item) {
          return CheckboxListTile(
            title: Text(item),
            value: _checkedItems[item],
            onChanged: (bool? value) {
              setState(() {
                _checkedItems[item] = value ?? false;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
