import 'package:arham_labs_assignment/utilities/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/app_prefs.dart';
import '../../app/di.dart';
import '../../utilities/resources/strings_manager.dart';

class LoginController extends GetxController {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  RxString phoneNumber = ''.obs;
  RxString countryCode = '+91'.obs; // Default to US country code

  RxString phoneNumberError = ''.obs;

  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Initialize phoneController with the default country code
    phoneController.text = countryCode.value;
    phoneController.addListener(() {
      print(phoneController);
      // // Remove the old country code if it exists
      // final text = phoneController.text;
      // if (!text.startsWith(countryCode.value)) {
      //   final newText = countryCode.value + text.replaceFirst(RegExp(r'^\+\d+'), '');
      //   phoneController.value = phoneController.value.copyWith(
      //     text: newText,
      //     selection: TextSelection.collapsed(offset: newText.length),
      //   );
      // }
    });
  }

  String? validatePhoneNumberLength(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.pleaseEnterYourPhoneNumber;
    } else if ((value.length - countryCode.value.length) < 10) {
      return AppStrings.phoneNumberMustBeAtLeast10Digits;
    }
    return null;
  }

  void requestOTP() {
    if (formKey.currentState?.validate() ?? false) {
      final enteredPhoneNumber = phoneController.text;

      Get.snackbar(AppStrings.oTPSent, AppStrings.oTPSent1234,
          duration: const Duration(seconds: 6));

      _appPreferences.setPhoneNumber(enteredPhoneNumber);

      Get.toNamed(Routes.otp);
    }
  }
}
