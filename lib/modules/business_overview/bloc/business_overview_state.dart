part of 'business_overview_bloc.dart';

@immutable
abstract class BusinessOverviewState {}

class BusinessOverviewInitial extends BusinessOverviewState {}

class LoadingState extends BusinessOverviewState {}

class DataFetchedState extends BusinessOverviewState {
  final List<BusinessInfoModel> infos;

  DataFetchedState({required this.infos});
}
