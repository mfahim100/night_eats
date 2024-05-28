import 'package:get_it/get_it.dart';
import 'package:night_eats/core/controllers/home_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Controller
  sl.registerLazySingleton(() => HomeController());

 }
