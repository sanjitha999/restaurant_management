part of 'business_overview_bloc.dart';

@immutable
abstract class BusinessOverviewEvent {}

class FetchBusinessOverviewEvent extends BusinessOverviewEvent {}

class ApproveBusinessEvent extends BusinessOverviewEvent {}

class RejectBusinessEvent extends BusinessOverviewEvent {}
