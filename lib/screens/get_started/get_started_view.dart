import 'package:arham_labs_assignment/utilities/resources/font_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/routes_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/strings_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/styles_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utilities/resources/assets_manager.dart';
import '../../utilities/resources/color_manager.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.splashColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppSize.s60),
              // Display the splash logo
              SvgPicture.asset(
                ImageAssets.splashLogo,
                width: AppSize.s46,
                height: AppSize.s44,
              ),
              const Spacer(),
              // Display the title text
              Text(
                AppStrings.getStartedTitle2,
                textAlign: TextAlign.center,
                style: getRegularStyle(
                    color: ColorManager.textColor1, fontSize: AppSize.s18),
              ),
              const Spacer(),
              // Display the login button
              buildLoginButton(),
              const SizedBox(
                height: AppSize.s32,
              ),
              // Display the terms and conditions text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: AppStrings.termsConditions1,
                    style: getRegularStyle(
                        color: ColorManager.textColor1, fontSize: FontSize.s14),
                    children: [
                      TextSpan(
                        text: AppStrings.termsConditions2,
                        style: getMediumStyle(
                            color: ColorManager.black, fontSize: FontSize.s14),
                      ),
                      TextSpan(
                        text: AppStrings.termsConditions3,
                        style: getRegularStyle(
                            color: ColorManager.textColor1,
                            fontSize: FontSize.s14),
                      ),
                      TextSpan(
                        text: AppStrings.termsConditions4,
                        style: getMediumStyle(
                            color: ColorManager.black, fontSize: FontSize.s14),
                      ),
                    ]),
              ),
              const SizedBox(height: AppSize.s24),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build the login button
  SizedBox buildLoginButton() {
    return SizedBox(
      width: AppSize.s320,
      height: AppSize.s48,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the login screen
          Get.toNamed(Routes.login);
        },
        child: Text(
          AppStrings.getStartedTitle1,
          style:
              getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
        ),
      ),
    );
  }
}
