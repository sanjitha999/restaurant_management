part of 'admins_list_bloc.dart';

@immutable
abstract class AdminsListState {}

class AdminsListLoadingState extends AdminsListState {}

class AdminListDisplayState extends AdminsListState {
  final List<BusinessUser> adminList;

  AdminListDisplayState({required this.adminList});
}
