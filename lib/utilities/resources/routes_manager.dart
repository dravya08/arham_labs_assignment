import 'package:arham_labs_assignment/screens/condition/condtion_view.dart';
import 'package:get/get.dart';

import '../../screens/get_started/get_started_view.dart';
import '../../screens/login/login_view.dart';
import '../../screens/otp/otp_view.dart';
import '../../screens/setup/setup_view.dart';
import '../../screens/splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String getStarted = "/getStarted";
  static const String login = "/login";
  static const String otp = "/otp";
  static const String setup = "/setup";
  static const String condition = "/condition";
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
  GetPage(
    name: Routes.login,
    page: () => const LoginView(),
  ),
  GetPage(
    name: Routes.otp,
    page: () => const OtpView(),
  ),
  GetPage(
    name: Routes.setup,
    page: () => const SetupView(),
  ),
  GetPage(
    name: Routes.condition,
    page: () => const ConditionView(),
  ),
];
