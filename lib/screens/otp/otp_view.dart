import 'package:arham_labs_assignment/controllers/otp/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utilities/resources/color_manager.dart';
import '../../utilities/resources/font_manager.dart';
import '../../utilities/resources/strings_manager.dart';
import '../../utilities/resources/styles_manager.dart';
import '../../utilities/resources/values_manager.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final OtpController otpController = Get.put(OtpController());

    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Form(
            // key: controller.formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                AppStrings.otpText1,
                style: getMediumStyle(
                    color: ColorManager.black, fontSize: FontSize.s24),
              ),
              RichText(
                text: TextSpan(
                  text: AppStrings.otpText2,
                  style: getRegularStyle(
                      color: ColorManager.textColor1, fontSize: FontSize.s16),
                  children: [
                    TextSpan(
                        text: otpController.phoneNumber.value,
                        style: getMediumStyle(
                            color: ColorManager.black, fontSize: FontSize.s16))
                  ],
                ),
              ),
              SizedBox(height: AppSize.s24),
              PinCodeTextField(
                appContext: context,
                length: 4,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onCompleted: (text) {
                  otpController.otp.value = text;
                },
                pinTheme: PinTheme(
                    inactiveColor: ColorManager.borderColor1,
                    shape: PinCodeFieldShape.box,
                    borderWidth: AppSize.s1,
                    borderRadius: BorderRadius.circular(AppSize.s10),
                    fieldHeight: AppSize.s80,
                    fieldWidth: AppSize.s80,
                    activeFillColor: Colors.white,
                    activeBorderWidth: AppSize.s1,
                    activeColor: ColorManager.black),
              ),
              SizedBox(height: AppSize.s20),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: otpController.isResendEnabled
                      ? () {
                          otpController.startTimer();
                          // Handle your resend functionality here
                        }
                      : null,
                  child: otpController.isResendEnabled
                      ? Text(
                          AppStrings.resendOTP,
                          style: getMediumStyle(
                              color: ColorManager.secondary,
                              fontSize: FontSize.s16),
                        )
                      : RichText(
                          text: TextSpan(
                              text: AppStrings.resendIn,
                              style: getRegularStyle(
                                  color: ColorManager.textColor1,
                                  fontSize: FontSize.s16),
                              children: [
                                TextSpan(
                                    text: "${otpController.timerSeconds}'s",
                                    style: getRegularStyle(
                                        color: ColorManager.black,
                                        fontSize: FontSize.s16))
                              ]),
                        ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: AppSize.s48,
                child: ElevatedButton(
                  onPressed: () => otpController.submit(),
                  child: Text(
                    AppStrings.submitOtp,
                    style: getRegularStyle(
                        color: ColorManager.white, fontSize: AppSize.s16),
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s20),
            ]),
          ),
        ),
      ),
    );
  }
}
