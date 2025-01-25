part of 'menu_approval_bloc.dart';

@immutable
abstract class MenuApprovalEvent {}

class FetchApprovalListEvent extends MenuApprovalEvent {}

class SubmitApprovalEvent extends MenuApprovalEvent {}