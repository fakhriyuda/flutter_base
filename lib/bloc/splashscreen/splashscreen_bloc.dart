
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splashscreen_event.dart';
part 'splashscreen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(SplashscreenInitial()) {
    on<SplashscreenEvent>((event, emit) async{
      try {
        emit(SplashscreenInitial());
        await Future.delayed(const Duration(seconds: 1))
            .then((value) => emit(const SplashscreenSuccess()));
      } catch (e) {
        emit(SplashscreenFailure(message: e.toString()));
        debugPrint('Error: $e');
      }
    });
  }
}
