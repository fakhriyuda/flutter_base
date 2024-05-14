import 'package:base_project/bloc/home/home_bloc.dart';
import 'package:base_project/bloc/splashscreen/splashscreen_bloc.dart';
import 'package:base_project/utils/locator.dart';
import 'package:flutter/material.dart';

class BlocLocator {
  Future<void> setup() async {
    debugPrint('BlocLocator initialized');

    locator
      ..registerSingleton<HomeBloc>(HomeBloc())
      ..registerSingleton<SplashscreenBloc>(SplashscreenBloc());
  }
}
