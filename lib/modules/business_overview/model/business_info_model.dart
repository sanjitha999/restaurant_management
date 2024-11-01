import 'package:resturant_management/modules/business_overview/model/business_info_item_model.dart';

class BusinessInfoModel {
  final String title;
  final List<BusinessInfoItemModel> items;

  BusinessInfoModel({required this.title, required this.items});
}
