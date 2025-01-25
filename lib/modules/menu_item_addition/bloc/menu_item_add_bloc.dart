import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resturant_management/modules/menu_item_addition/model/add_menu_item_response_model.dart';
import 'package:resturant_management/modules/menu_item_addition/model/menu_item_model.dart';
import 'package:resturant_management/modules/menu_item_addition/webservice/menu_item_add_repo.dart';

part 'menu_item_add_event.dart';

part 'menu_item_add_state.dart';

class MenuItemAddBloc extends Bloc<MenuItemAddEvent, MenuItemAddState> {
  final MenuItemRepository repository;
  final String businessId;

  MenuItemAddBloc({
    required this.repository,
    required this.businessId,
  }) : super(LoadingState()) {
    on<OnNameInput>(_onNameInput);
    on<OnDescriptionInput>(_onDescriptionInput);
    on<OnIngredientsInput>(_onIngredientsInput);
    on<OnMenuTypeInput>(_onMenuTypeInput);
    on<OnCategoryInput>(_onCategoryInput);
    on<OnSubcategoryInput>(_onSubcategoryInput);
    on<OnQuantityInput>(_onQuantityInput);
    on<OnPriceInput>(_onPriceInput);
    on<OnItemTypeInput>(_onItemtypeInput);
    on<OnAvailabilityInput>(_onAvailabilityInput);
    on<SubmitMenuDetails>(_onSubmitMenuDetails);
    on<ImageInput>(_onImageInput);
  }

  String? _name;
  String? _description;
  String? _ingredients;
  String? _menuType = MenuType.veg.val;
  String? _category;
  String? _subcategory;
  String? _quantity;
  double? _price;
  String? _itemType;
  bool? _isAvailable = true;
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  void _onNameInput(
    OnNameInput event,
    Emitter<MenuItemAddState> emit,
  ) {
    _name = event.name;
    if (state is! MenuContentState) {
      emit(MenuContentState(showButton: _isFormValid()));
    } else {
      emit((state as MenuContentState).copyWith(showButton: _isFormValid()));
    }
  }

  bool _isFormValid() {
    return _name != null &&
        _name!.isNotEmpty &&
        _description != null &&
        _description!.isNotEmpty &&
        _ingredients != null &&
        _ingredients!.isNotEmpty &&
        _menuType != null &&
        _menuType!.isNotEmpty &&
        _category != null &&
        _category!.isNotEmpty &&
        _subcategory != null &&
        _subcategory!.isNotEmpty &&
        _quantity != null &&
        _quantity!.isNotEmpty &&
        _price != null &&
        _price != 0 &&
        _itemType != null &&
        _itemType!.isNotEmpty &&
        _isAvailable != null &&
        _imageFile != null;
  }

  void _onDescriptionInput(
    OnDescriptionInput event,
    Emitter<MenuItemAddState> emit,
  ) {
    _description = event.description;
    emit((state as MenuContentState).copyWith(showButton: _isFormValid()));
  }

  void _onIngredientsInput(
    OnIngredientsInput event,
    Emitter<MenuItemAddState> emit,
  ) {
    _ingredients = event.ingredients;
    emit((state as MenuContentState).copyWith(showButton: _isFormValid()));
  }

  void _onMenuTypeInput(
    OnMenuTypeInput event,
    Emitter<MenuItemAddState> emit,
  ) {
    _menuType = event.menuType.val.toString();
    emit((state as MenuContentState).copyWith(showButton: _isFormValid()));
  }

  void _onCategoryInput(
    OnCategoryInput event,
    Emitter<MenuItemAddState> emit,
  ) {
    _category = event.category;
    emit((state as MenuContentState).copyWith(showButton: _isFormValid()));
  }

  void _onSubcategoryInput(
    OnSubcategoryInput event,
    Emitter<MenuItemAddState> emit,
  ) {
    _subcategory = event.subCat;
    emit((state as MenuContentState).copyWith(showButton: _isFormValid()));
  }

  void _onQuantityInput(
    OnQuantityInput event,
    Emitter<MenuItemAddState> emit,
  ) {
    _quantity = event.quant;
    emit((state as MenuContentState).copyWith(showButton: _isFormValid()));
  }

  void _onPriceInput(
    OnPriceInput event,
    Emitter<MenuItemAddState> emit,
  ) {
    _price = event.price;
    emit((state as MenuContentState).copyWith(showButton: _isFormValid()));
  }

  void _onItemtypeInput(
    OnItemTypeInput event,
    Emitter<MenuItemAddState> emit,
  ) {
    _itemType = event.itemType;
    emit((state as MenuContentState).copyWith(showButton: _isFormValid()));
  }

  void _onAvailabilityInput(
    OnAvailabilityInput event,
    Emitter<MenuItemAddState> emit,
  ) {
    _isAvailable = event.isAvailable;
    emit((state as MenuContentState).copyWith(showButton: _isFormValid()));
  }

  Future<void> _onImageInput(
    ImageInput event,
    Emitter<MenuItemAddState> emit,
  ) async {
    await _pickImage(event.imageSource);
    emit((state as MenuContentState).copyWith(
      showButton: _isFormValid(),
      image: _imageFile,
    ));
  }

  Future<void> _onSubmitMenuDetails(
    SubmitMenuDetails event,
    Emitter<MenuItemAddState> emit,
  ) async {
    try {
      final MenuItemModel menuItemModel = MenuItemModel(
        name: _name,
        description: _description,
        ingredients: _ingredients,
        menutype: _menuType,
        category: _category,
        subcategory: _subcategory,
        quantity: _quantity,
        price: _price?.toInt(),
        itemType: _itemType,
        isAvailable: _isAvailable,
      );

      final AddMenuItemResponseModel? response = await repository.addMenuItem(
        menuItem: menuItemModel,
        businessId: businessId,
      );

      if (response != null) {
        await repository.uploadMenuItemImage(
          businessId: businessId,
          menuId: response.menuItemId,
          imageFile: _imageFile ?? File(""),
        );
        emit(SuccessState(message: response.message));
      } else {
        emit(ExceptionState(message: "Couldn't add your menu"));
      }
      //Send this model to request
    } catch (e) {
     debugPrint("MyTEst :: item add exception $e");
      emit(ExceptionState(message: e.toString()));
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      _imageFile = File(image.path);
    }
  }
}
