import 'package:base_project/data/model/posts.dart';
import 'package:base_project/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Posts> posts = [];

  HomeBloc() : super(HomeInitial()) {
    on<GetHome>((event, emit) async {
      try {
        debugPrint("Loading now...");
        emit(HomeLoading());
        final response = await HomeRepository().getPosts();
        debugPrint('Response: $response');
        posts = response ?? [];
        emit(const HomeSuccess(message: 'Home Success'));
        debugPrint("Success...");
      } catch (e) {
        emit(HomeFailure(message: e.toString()));
      }
    });
  }
}
