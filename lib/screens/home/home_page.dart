import 'package:base_project/bloc/home/home_bloc.dart';
import 'package:base_project/screens/profile/profile_page.dart';
import 'package:base_project/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = locator.get<HomeBloc>();
    homeBloc.add(GetHome());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listener: (context, state) {
          if (state is HomeFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          } else if (state is HomeSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          }
        },
        builder: (context, state) {
          if (state is HomeInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoading) {
            return const Text("Loading...");
          } else if (state is HomeFailure) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is HomeSuccess) {
            return ListView.builder(
              itemCount: homeBloc.posts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                  child: ListTile(
                    title: Text(homeBloc.posts[index].title ?? ''),
                    subtitle: Text(homeBloc.posts[index].body ?? ''),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    ));
  }
}
