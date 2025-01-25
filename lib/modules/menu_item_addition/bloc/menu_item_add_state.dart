part of 'menu_item_add_bloc.dart';

@immutable
abstract class MenuItemAddState extends Equatable {}

class LoadingState extends MenuItemAddState {
  @override
  List<Object?> get props => [];
}

class MenuContentState extends MenuItemAddState {
  final bool showButton;
  final File? image;

  MenuContentState({
    required this.showButton,
    this.image,
  });

  @override
  List<Object?> get props => [showButton, image];

  MenuContentState copyWith({
    bool? showButton,
    File? image,
  }) {
    return MenuContentState(
      showButton: showButton ?? this.showButton,
      image: image ?? this.image,
    );
  }
}


class ExceptionState extends MenuItemAddState {
  final String message;

  ExceptionState({required this.message});

  @override
  List<Object?> get props => [message];
}

class SuccessState extends MenuItemAddState {
  final String message;

  SuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}
