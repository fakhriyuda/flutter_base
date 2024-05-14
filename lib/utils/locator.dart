import 'package:base_project/services/network/network.dart';
import 'package:base_project/utils/bloc_locator.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;
void setupLocator() async {
  // Register services
  locator.registerLazySingleton<Network>(() => Network());
  // Register repositories
  // Register blocs
  await BlocLocator().setup();
  // Register usecases
  // Register controllers
}
