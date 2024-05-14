import 'package:base_project/bloc/home/home_bloc.dart';
import 'package:base_project/utils/locator.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late HomeBloc homeBloc;
  @override
  void initState() {
    homeBloc = locator.get<HomeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(homeBloc.posts[0].title ?? ''),
      ),
    );
  }
}
