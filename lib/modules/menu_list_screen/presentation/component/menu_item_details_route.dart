import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resturant_management/modules/menu_list_screen/model/menu_item_model.dart';
import 'package:resturant_management/modules/menu_list_screen/presentation/component/rating_component.dart';
import 'package:resturant_management/modules/menu_list_screen/presentation/component/veg_non_veg_indicator_widget.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/font_consts.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/utils/string_utils.dart';

class MenuItemDetailsRoute extends StatelessWidget {
  final MenuItemDisplayModel menuItem;
  final Uint8List? image;

  const MenuItemDetailsRoute({
    super.key,
    required this.menuItem,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          menuItem.itemName,
          style: TextStyle(
            fontSize: FontSize.large,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              SizedBoxSpacing.height20,
              _buildTitle(),
              _buildRating(),
              Divider(thickness: 1, color: AppColors.textGrey),
              _buildPrice(),
              SizedBoxSpacing.height10,
              _buildQuantity(),
              SizedBoxSpacing.height10,
              _buildIngredients(),
              SizedBoxSpacing.height10,
              _buildItemType(),
              SizedBoxSpacing.height10,
              _buildAvailability(),
              SizedBoxSpacing.height20,
              Divider(thickness: 1, color: AppColors.textGrey),
              _buildDescription(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (image != null) {
      return AspectRatio(
        aspectRatio: 1,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius12),
            color: AppColors.textGrey,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius12),
            child: Image.memory(
              image!,
              fit: BoxFit.cover, // Ensures the image fills the container
            ),
          ),
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: 1,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius12),
            color: AppColors.textGrey,
          ),
          child: Icon(
            Icons.image,
            color: Colors.white70,
            size: 50,
          ),
        ),
      );
    }
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius12),
          color: AppColors.textGrey,
        ),
        child: const Center(
          child: Icon(
            Icons.image,
            color: Colors.white70,
            size: 50,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Expanded(
          child: Text(
            menuItem.itemName,
            style: TextStyle(
              fontSize: FontSize.size28,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
        ),
        VegNonVegIndicatorWidget(
          menuType: menuItem.menuType,
        )
      ],
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        const RatingComponent(),
        SizedBoxSpacing.width10,
        Text(
          "🌟 Rated 4.5 by food lovers worldwide!",
          style: TextStyle(
            color: AppColors.accent,
          ),
        )
      ],
    );
  }

  Widget _buildPrice() {
    return Text(
      "💰 Just for: ${currencyFormatWithSpace(menuItem.price)}",
      style: TextStyle(
        fontSize: FontSize.title,
        fontWeight: FontWeight.bold,
        color: AppColors.accent,
      ),
    );
  }

  Widget _buildQuantity() {
    return Text(
      "🍽️ Serves: ${menuItem.quantity} delightful person(s)",
      style: TextStyle(
        fontSize: FontSize.subtitle,
        color: AppColors.primaryText,
      ),
    );
  }

  Widget _buildIngredients() {
    return Text(
      "🧑‍🍳 Crafted with love and care: ${menuItem.ingredients}",
      style: TextStyle(
        fontSize: FontSize.subtitle,
        fontStyle: FontStyle.italic,
        color: AppColors.accent,
      ),
    );
  }

  Widget _buildItemType() {
    return Text(
      "🍴 Category: ${menuItem.itemType}",
      style: TextStyle(
        fontSize: FontSize.subtitle,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryText,
      ),
    );
  }

  Widget _buildAvailability() {
    return Text(
      menuItem.isAvailable
          ? "🎉 Hooray! This dish is currently available!"
          : "😔 Oops, this dish is out of stock.",
      style: TextStyle(
        fontSize: FontSize.subtitle,
        color: menuItem.isAvailable
            ? AppColors.successGreen
            : AppColors.errorColor,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      "📖 Here’s the story behind this delicious dish:\n${menuItem.description}",
      style: TextStyle(
        fontSize: FontSize.subtitle,
        height: 1.5,
        color: AppColors.primaryText,
      ),
    );
  }
}

// class MenuItemDetailsRoute extends StatelessWidget {
//   final MenuItemDisplayModel menuItem;
//
//   const MenuItemDetailsRoute({super.key, required this.menuItem});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: 20,
//             horizontal: 20,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildImage(),
//               SizedBoxSpacing.height20,
//               _buildTitle(),
//               _buildRating(),
//               _buildOtherDetails(),
//               _buildQuantity(),
//               _buildDescription(),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildImage() {
//     return AspectRatio(
//       aspectRatio: 1, // Set aspect ratio as 1 to make it a square container
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(Dimensions.radius12),
//           color: AppColors.textGrey,
//         ),
//         child: const Center(
//           child: Icon(
//             Icons.image,
//             color: Colors.white70,
//             size: 50,
//           ), // Placeholder icon for visual indication
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTitle() {
//     return Row(
//       children: [
//         Expanded(
//           child: Text(
//             menuItem.itemName,
//             style: TextStyle(
//               fontSize: FontSize.size24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         VegNonVegIndicatorWidget(
//           menuType: menuItem.menuType,
//         )
//       ],
//     );
//   }
//
//   Widget _buildRating() {
//     return const RatingComponent();
//   }
//
//   Widget _buildQuantity() {
//     return Text("Serves 1");
//   }
//
//   Widget _buildDescription() {
//     return Text(menuItem.description);
//   }
//
//   Widget _buildOtherDetails() {
//     return Text(
//       currencyFormatWithSpace(menuItem.price),
//       style: TextStyleConst.title,
//     );
//   }
// }
