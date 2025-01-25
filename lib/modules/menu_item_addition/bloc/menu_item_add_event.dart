part of 'menu_item_add_bloc.dart';

@immutable
abstract class MenuItemAddEvent {}

class OnNameInput extends MenuItemAddEvent {
  final String name;

  OnNameInput({required this.name});
}

class OnDescriptionInput extends MenuItemAddEvent {
  final String description;

  OnDescriptionInput({required this.description});
}

class OnIngredientsInput extends MenuItemAddEvent {
  final String ingredients;

  OnIngredientsInput({required this.ingredients});
}

class OnMenuTypeInput extends MenuItemAddEvent {
  final MenuType menuType;

  OnMenuTypeInput({required this.menuType});
}

class OnCategoryInput extends MenuItemAddEvent {
  final String category;

  OnCategoryInput({required this.category});
}

class OnSubcategoryInput extends MenuItemAddEvent {
  final String subCat;

  OnSubcategoryInput({required this.subCat});
}

class OnQuantityInput extends MenuItemAddEvent {
  final String quant;

  OnQuantityInput({required this.quant});
}

class OnPriceInput extends MenuItemAddEvent {
  final double price;

  OnPriceInput({required this.price});
}

class ImageInput extends MenuItemAddEvent {
  final ImageSource imageSource;

  ImageInput({required this.imageSource});
}

class OnItemTypeInput extends MenuItemAddEvent {
  final String itemType;

  OnItemTypeInput({required this.itemType});
}

class OnAvailabilityInput extends MenuItemAddEvent {
  final bool isAvailable;

  OnAvailabilityInput({required this.isAvailable});
}

class SubmitMenuDetails extends MenuItemAddEvent {}
