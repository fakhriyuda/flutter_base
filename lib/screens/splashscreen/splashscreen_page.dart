import 'package:base_project/bloc/splashscreen/splashscreen_bloc.dart';
import 'package:base_project/screens/home/home_page.dart';
import 'package:base_project/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  late SplashscreenBloc splashscreenBloc;
  @override
  void initState() {
    splashscreenBloc = locator.get<SplashscreenBloc>();
    splashscreenBloc.add(SplashscreenStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashscreenBloc, SplashscreenState>(
        bloc: splashscreenBloc,
        listener: (context, state) {
          if (state is SplashscreenSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("You got it!"),
            ));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is SplashscreenInitial) {
            return const Center(
              child: Text("Splashscreen"),
            );
          } else if (state is SplashscreenFailure) {
            return Center(
              child: Text(state.message),
            );
          }
          return Container();
        },
      ),
    );
  }
}
