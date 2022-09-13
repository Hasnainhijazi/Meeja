import 'package:get_it/get_it.dart';

import '../core/services/auth_services.dart';

GetIt locator = GetIt.instance;

setupLocator(){
  print("AuthServices calling");
  locator.registerSingleton(AuthServices());
  // locator.registerSingleton(DatabaseServices());
  print("AuthServices registered");
}