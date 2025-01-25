import 'package:flutter/material.dart';
import 'package:resturant_management/modules/admins_list_screen/models/business_user_models.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/font_consts.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class BusinessUserTile extends StatelessWidget {
  final BusinessUser user;
  final VoidCallback onTap;

  const BusinessUserTile({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: ListTile(
        tileColor: AppColors.white,
        leading: Container(
          decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppColors.background,
          ),
          child: const Icon(
            Icons.person,
            size: 50,
            color: AppColors.primary,
          ),
        ),
        title: Text(
          "${user.firstName ?? ''} ${user.lastName ?? ''}".trim(),
          style: TextStyleConst.title,
        ),
        subtitle: Text(
          "Role: ${user.roles?.join(", ")}\nMobile: ${user.mobileNumber}",
          style: TextStyle(fontSize: FontSize.subtitle),
        ),
        onTap: onTap,
      ),
    );
  }
}
