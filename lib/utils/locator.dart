import 'package:Pool/viewModels/validateLogin.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance();
void setupLocator() {
  locator.registerLazySingleton(() => ValidateLoginModel());
}
