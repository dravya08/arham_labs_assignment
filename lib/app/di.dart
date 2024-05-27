import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/dio_client.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // Get the instance of SharedPreferences
  final sharedPrefs = await SharedPreferences.getInstance();

  // Register the SharedPreferences instance as a lazy singleton
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // Register the AppPreferences instance as a lazy singleton
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // Register the DioClient instance as a lazy singleton
  instance.registerLazySingleton<DioClient>(() => DioClient());
}

