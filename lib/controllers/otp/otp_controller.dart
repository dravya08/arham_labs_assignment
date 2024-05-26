import 'dart:async';

import 'package:arham_labs_assignment/utilities/resources/strings_manager.dart';
import 'package:get/get.dart';

import '../../app/app_prefs.dart';
import '../../app/di.dart';

class OtpController extends GetxController {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  RxString phoneNumber = "".obs;

  RxString otp = ''.obs;

  RxInt timerSeconds = 20.obs;
  bool get isResendEnabled => timerSeconds.value == 0;
  late Timer _timer;

  @override
  void onInit() {
    getInitialValue();
    startTimer();
    super.onInit();
  }

  getInitialValue() async {
    phoneNumber.value = await _appPreferences.getPhoneNumber();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  void startTimer() {
    timerSeconds.value = 20;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
      } else {
        _timer.cancel();
      }
    });
    Get.snackbar(AppStrings.oTPSent, AppStrings.oTPSent1234,
        duration: const Duration(seconds: 6));
  }

  void submit() {
    if (otp.isNotEmpty || otp.value.length <= 4) return;
  }
}
