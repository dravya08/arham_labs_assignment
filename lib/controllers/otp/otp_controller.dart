import 'dart:async';

import 'package:arham_labs_assignment/utilities/resources/routes_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/strings_manager.dart';
import 'package:get/get.dart';

import '../../app/app_prefs.dart';
import '../../app/di.dart';

class OtpController extends GetxController {
  // Instance of AppPreferences obtained from GetIt
  final AppPreferences _appPreferences = instance<AppPreferences>();

  // Observable strings to hold phone number and OTP
  RxString phoneNumber = "".obs;
  RxString otp = ''.obs;

  // Observable integer to track the timer seconds for OTP resend
  RxInt timerSeconds = 20.obs;

  // Property to check if resend is enabled based on timer value
  bool get isResendEnabled => timerSeconds.value == 0;

  // Timer to handle the countdown for OTP resend
  late Timer _timer;

  @override
  void onInit() {
    // Get the initial phone number value from AppPreferences
    getInitialValue();
    // Start the timer for OTP resend
    startTimer();
    super.onInit();
  }

  // Method to get the initial phone number value from AppPreferences
  getInitialValue() async {
    phoneNumber.value = await _appPreferences.getPhoneNumber();
  }

  @override
  void onClose() {
    // Cancel the timer when the controller is closed
    _timer.cancel();
    super.onClose();
  }

  // Method to start the timer for OTP resend
  void startTimer() {
    // Initialize the timer seconds to 20
    timerSeconds.value = 20;
    // Start a periodic timer that decrements the timer seconds every second
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
      } else {
        // Cancel the timer when it reaches 0
        _timer.cancel();
      }
    });
    // Show a snackbar notification indicating that the OTP has been sent
    Get.snackbar(AppStrings.oTPSent, AppStrings.oTPSent1234,
        duration: const Duration(seconds: 6));
  }

  // Method to handle the OTP submission
  void submit() {
    // Check if the OTP is not empty and has 4 characters
    if (otp.isEmpty || otp.value.length != 4) return;

    // Navigate to the setup screen
    Get.offNamed(Routes.setup);
  }
}
