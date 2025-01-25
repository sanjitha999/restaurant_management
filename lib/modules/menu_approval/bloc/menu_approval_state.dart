part of 'menu_approval_bloc.dart';

@immutable
abstract class MenuApprovalState {}

class MenuApprovalLoading extends MenuApprovalState {}

class MenuCheckListContent extends MenuApprovalState {
  final List<TitleItemsModel> checkListContent;

  MenuCheckListContent({required this.checkListContent});
}

class SuccessState extends MenuApprovalState {
  final String message;

  SuccessState({required this.message});
}

class ExceptionState extends MenuApprovalState {
  final String message;

  ExceptionState({required this.message});
}
