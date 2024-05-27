import 'package:arham_labs_assignment/utilities/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/app_prefs.dart';
import '../../app/di.dart';
import '../../utilities/resources/strings_manager.dart';

class LoginController extends GetxController {
  // Instance of AppPreferences obtained from GetIt
  final AppPreferences _appPreferences = instance<AppPreferences>();

  // Observable strings to hold phone number, country code, and phone number error message
  RxString phoneNumber = ''.obs;
  RxString countryCode = '+91'.obs; // Default to India country code

  RxString phoneNumberError = ''.obs;

  // Key for the form widget
  final formKey = GlobalKey<FormState>();
  // TextEditingController for the phone number input field
  final TextEditingController phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Initialize phoneController with the default country code
    phoneController.text = countryCode.value;
    // Add a listener to update phoneNumber whenever the text in phoneController changes
    phoneController.addListener(() {
      phoneNumber.value = phoneController.text;
    });
  }

  // Method to validate the length of the phone number
  String? validatePhoneNumberLength(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.pleaseEnterYourPhoneNumber;
    } else if ((value.length - countryCode.value.length) < 10) {
      return AppStrings.phoneNumberMustBeAtLeast10Digits;
    }
    return null;
  }

  // Method to request an OTP
  void requestOTP() {
    // Check if the form is valid
    if (formKey.currentState?.validate() ?? false) {
      final enteredPhoneNumber = phoneController.text;

      // Show a snackbar notification indicating that the OTP has been sent
      Get.snackbar(AppStrings.oTPSent, AppStrings.oTPSent1234,
          duration: const Duration(seconds: 6));

      // Save the entered phone number using AppPreferences
      _appPreferences.setPhoneNumber(enteredPhoneNumber);

      // Navigate to the OTP screen
      Get.toNamed(Routes.otp);
    }
  }
}
