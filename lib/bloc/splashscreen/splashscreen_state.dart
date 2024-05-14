part of 'splashscreen_bloc.dart';

sealed class SplashscreenState extends Equatable {
  const SplashscreenState();
  
  @override
  List<Object> get props => [];
}

final class SplashscreenInitial extends SplashscreenState {}
final class SplashscreenSuccess extends SplashscreenState {
  final String message;
  
  const SplashscreenSuccess({this.message = 'Splashscreen Success'});
  
  @override
  List<Object> get props => [message];
}
final class SplashscreenFailure extends SplashscreenState {
  final String message;
  
  const SplashscreenFailure({this.message = 'Splashscreen Failure'});
  
  @override
  List<Object> get props => [message];
}
