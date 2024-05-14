part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {
  final String message;

  const HomeSuccess({this.message = 'Home Success'});

  @override
  List<Object> get props => [message];
}

final class HomeFailure extends HomeState {
  final String message;

  const HomeFailure({this.message = 'Home Failure'});

  @override
  List<Object> get props => [message];
}

final class HomeLoading extends HomeState {}
