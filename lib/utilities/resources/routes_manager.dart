import 'package:get/get.dart';

import '../../screens/get_started/get_started_view.dart';
import '../../screens/splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String getStarted = "/getStarted";
}

final getPages = [
  GetPage(
    name: Routes.splashRoute,
    page: () => const SplashView(),
  ),
  GetPage(
    name: Routes.getStarted,
    page: () => const GetStartedView(),
  ),
];
