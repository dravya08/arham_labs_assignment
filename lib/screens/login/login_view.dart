import 'package:arham_labs_assignment/utilities/resources/color_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/font_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/strings_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/styles_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/values_manager.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.loginText1,
                style: getMediumStyle(
                    color: ColorManager.black, fontSize: FontSize.s24),
              ),
              Text(
                AppStrings.loginText2,
                style: getRegularStyle(
                    color: ColorManager.textColor1, fontSize: FontSize.s14),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: AppSize.s60,
                    decoration: BoxDecoration(
                        color: ColorManager.cardColor1,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppSize.s10))),
                    child: CountryCodePicker(
                      padding: EdgeInsets.zero,
                      showDropDownButton: true,
                      showFlagMain: true,
                      onChanged: (countryCode) {
                        controller.countryCode.value = countryCode.dialCode!;
                        controller.phoneController.text = countryCode.dialCode!;
                      },
                      initialSelection: 'IN',
                      favorite: const ['+91', 'IN'],
                      flagWidth: AppSize.s32,
                      showOnlyCountryWhenClosed: false,
                      hideMainText: true,
                    ),
                  ),
                  const SizedBox(width: AppSize.s10),
                  Expanded(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: AppStrings.enterPhoneNumber,
                        // contentPadding: EdgeInsets.symmetric(
                        //     vertical: AppPadding.p20,
                        //     horizontal: AppPadding.p12),
                        border: OutlineInputBorder(),
                      ),
                      validator: controller.validatePhoneNumberLength,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Obx(
                () => controller.phoneNumber.value.length -
                            controller.countryCode.value.length ==
                        10
                    ? SizedBox(
                        width: double.infinity,
                        height: AppSize.s48,
                        child: ElevatedButton(
                          onPressed: () => controller.requestOTP(),
                          child: Text(
                            AppStrings.getStartedTitle1,
                            style: getRegularStyle(
                                color: ColorManager.white,
                                fontSize: AppSize.s16),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ),
              const SizedBox(height: AppSize.s20),
            ],
          ),
        ),
      ),
    );
  }
}
