part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class FetchInitialData extends SplashEvent {}

class FetchRouting extends SplashEvent {}
