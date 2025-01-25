import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resturant_management/generated/l10n.dart';
import 'package:resturant_management/modules/menu_item_addition/bloc/menu_item_add_bloc.dart';
import 'package:resturant_management/modules/menu_item_addition/model/menu_item_model.dart';
import 'package:resturant_management/modules/menu_item_addition/presentation/component/image_button.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/spacing.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class MenuForm extends StatefulWidget {
  const MenuForm({super.key});

  @override
  State<MenuForm> createState() => _MenuFormState();
}

class _MenuFormState extends State<MenuForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _subcategoryController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _itemTypeController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();
  final FocusNode _ingredientsFocus = FocusNode();
  final FocusNode _categoryFocus = FocusNode();
  final FocusNode _subcategoryFocus = FocusNode();
  final FocusNode _quantityFocus = FocusNode();
  final FocusNode _priceFocus = FocusNode();
  final FocusNode _itemTypeFocus = FocusNode();
  bool isVeg = true;
  bool isAvailable = true;

  @override
  void initState() {
    super.initState();
    // Initialize form fields if needed (e.g., pre-fill based on Bloc data)
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameField(),
          SizedBoxSpacing.height24,
          _buildDescriptionField(),
          SizedBoxSpacing.height24,
          _buildIngredientsField(),
          SizedBoxSpacing.height24,
          _buildUploadImage(),
          SizedBoxSpacing.height24,
          _buildMenuTypeField(),
          SizedBoxSpacing.height24,
          _buildCategoryField(),
          SizedBoxSpacing.height24,
          _buildSubcategoryField(),
          SizedBoxSpacing.height24,
          _buildItemTypeField(),
          SizedBoxSpacing.height24,
          _buildQuantityField(),
          SizedBoxSpacing.height24,
          _buildPriceField(),
          SizedBoxSpacing.height24,
          _buildAvailabilityField(),
          SizedBoxSpacing.height24,
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      focusNode: _nameFocus,
      decoration: InputDecoration(
        labelText: Strings.of(context).menuItemName,
      ),
      onChanged: (name) {
        BlocProvider.of<MenuItemAddBloc>(context).add(OnNameInput(name: name));
      },
      onFieldSubmitted: (_) {
        _descriptionFocus.requestFocus();
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: _descriptionController,
      focusNode: _descriptionFocus,
      decoration: InputDecoration(
        labelText: Strings.of(context).description,
      ),
      onChanged: (description) {
        BlocProvider.of<MenuItemAddBloc>(context)
            .add(OnDescriptionInput(description: description));
      },
      onFieldSubmitted: (_) {
        _ingredientsFocus.requestFocus();
      },
    );
  }

  Widget _buildIngredientsField() {
    return TextFormField(
      controller: _ingredientsController,
      focusNode: _ingredientsFocus,
      decoration: InputDecoration(
        labelText: Strings.of(context).ingredients,
      ),
      onChanged: (ingredients) {
        BlocProvider.of<MenuItemAddBloc>(context)
            .add(OnIngredientsInput(ingredients: ingredients));
      },
      onFieldSubmitted: (_) {},
    );
  }

  Widget _buildMenuTypeField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Menu Type :",
          style: TextStyleConst.title,
        ),
        Column(
          children: [
            Switch(
              value: isVeg,
              activeColor:
                  isVeg ? AppColors.successGreen : AppColors.errorColor,
              // Green for Veg, Red for Non-Veg
              inactiveThumbColor:
                  isVeg ? AppColors.successGreen : AppColors.errorColor,
              // Red when Non-Veg
              inactiveTrackColor: isVeg
                  ? AppColors.successGreen.withOpacity(0.3)
                  : AppColors.errorColor.withOpacity(0.3),
              // Track color when inactive
              focusColor: Colors.transparent,
              // Removes any focus outline
              hoverColor: Colors.transparent,
              // Removes hover color
              onChanged: (bool value) {
                setState(() {
                  isVeg = value;
                  BlocProvider.of<MenuItemAddBloc>(context).add(
                    OnMenuTypeInput(
                        menuType: isVeg ? MenuType.veg : MenuType.nonVeg),
                  );
                });
              },
              trackOutlineColor: WidgetStateProperty.all(isVeg
                  ? AppColors.successGreen.withOpacity(0.3)
                  : AppColors.errorColor.withOpacity(0.3)),
            ),
            Text(
              isVeg ? MenuType.veg.displayText : MenuType.nonVeg.displayText,
              style: TextStyleConst.semiBoldText,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAvailabilityField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Available :",
          style: TextStyleConst.title,
        ),
        Column(
          children: [
            Switch(
              value: isAvailable,
              activeColor:
                  isAvailable ? AppColors.successGreen : AppColors.errorColor,
              // Green for Veg, Red for Non-Veg
              inactiveThumbColor:
                  isAvailable ? AppColors.successGreen : AppColors.errorColor,
              // Red when Non-Veg
              inactiveTrackColor: isAvailable
                  ? AppColors.successGreen.withOpacity(0.3)
                  : AppColors.errorColor.withOpacity(0.3),
              // Track color when inactive
              focusColor: Colors.transparent,
              // Removes any focus outline
              hoverColor: Colors.transparent,
              // Removes hover color
              onChanged: (bool value) {
                setState(() {
                  isAvailable = value;
                  BlocProvider.of<MenuItemAddBloc>(context).add(
                    OnAvailabilityInput(isAvailable: isAvailable),
                  );
                });
              },
              trackOutlineColor: WidgetStateProperty.all(isAvailable
                  ? AppColors.successGreen.withOpacity(0.3)
                  : AppColors.errorColor.withOpacity(0.3)),
            ),
            Text(
              isAvailable ? "Available" : "Not Available",
              style: TextStyleConst.semiBoldText,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryField() {
    return TextFormField(
      controller: _categoryController,
      focusNode: _categoryFocus,
      decoration: InputDecoration(
        labelText: Strings.of(context).category,
      ),
      onChanged: (category) {
        BlocProvider.of<MenuItemAddBloc>(context)
            .add(OnCategoryInput(category: category));
      },
      onFieldSubmitted: (_) {
        _subcategoryFocus.requestFocus();
      },
    );
  }

  Widget _buildSubcategoryField() {
    return TextFormField(
      controller: _subcategoryController,
      focusNode: _subcategoryFocus,
      decoration: InputDecoration(
        labelText: Strings.of(context).subcategory,
      ),
      onChanged: (subcategory) {
        BlocProvider.of<MenuItemAddBloc>(context)
            .add(OnSubcategoryInput(subCat: subcategory));
      },
      onFieldSubmitted: (_) {
        _itemTypeFocus.requestFocus();
      },
    );
  }

  Widget _buildItemTypeField() {
    return TextFormField(
      controller: _itemTypeController,
      focusNode: _itemTypeFocus,
      decoration: InputDecoration(
        labelText: Strings.of(context).itemType,
      ),
      onChanged: (itemType) {
        BlocProvider.of<MenuItemAddBloc>(context)
            .add(OnItemTypeInput(itemType: itemType));
      },
      onFieldSubmitted: (_) {
        _quantityFocus.requestFocus();
      },
    );
  }

  Widget _buildQuantityField() {
    return TextFormField(
      controller: _quantityController,
      focusNode: _quantityFocus,
      decoration: InputDecoration(
        labelText: Strings.of(context).quantity,
      ),
      onChanged: (quantity) {
        BlocProvider.of<MenuItemAddBloc>(context)
            .add(OnQuantityInput(quant: quantity));
      },
      onFieldSubmitted: (_) {
        _priceFocus.requestFocus();
      },
    );
  }

  Widget _buildPriceField() {
    return TextFormField(
      controller: _priceController,
      focusNode: _priceFocus,
      decoration: InputDecoration(
        labelText: Strings.of(context).price,
      ),
      onChanged: (price) {
        BlocProvider.of<MenuItemAddBloc>(context)
            .add(OnPriceInput(price: double.tryParse(price) ?? 0.0));
      },
      keyboardType: TextInputType.number,
      onFieldSubmitted: (_) {
        _priceFocus.unfocus();
      },
    );
  }

  Widget _buildUploadImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload Image :",
          style: TextStyleConst.title,
        ),
        SizedBoxSpacing.height10,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<MenuItemAddBloc, MenuItemAddState>(
              buildWhen: (previous, current) => current is MenuContentState,
              builder: (context, state) {
                if (state is MenuContentState) {
                  if (state.image != null) {
                    return Image.file(
                      state.image!,
                      width: 100,
                      height: 100,
                    );

                  } else {
                    return Container(
                      height: 100,
                      width: 100,
                      color: AppColors.textGrey,
                    );
                  }
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageUploadButton(
                  source: ImageSource.gallery,
                  onTap: () => BlocProvider.of<MenuItemAddBloc>(context).add(
                    ImageInput(imageSource: ImageSource.gallery),
                  ),
                ),
                SizedBoxSpacing.height4,
                ImageUploadButton(
                  source: ImageSource.camera,
                  onTap: () => BlocProvider.of<MenuItemAddBloc>(context).add(
                    ImageInput(imageSource: ImageSource.camera),
                  ),
                ),
              ],
            ),

            // const ImageUploadButton(
            //   source: ImageSource.camera,
            // ),
          ],
        ),
      ],
    );
  }
}
