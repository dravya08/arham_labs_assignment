import 'package:arham_labs_assignment/utilities/resources/assets_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/color_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/font_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/routes_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/strings_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/styles_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blue,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppSize.s100), // Spacing
              SvgPicture.asset(ImageAssets.starWhite), // Star SVG image
              const SizedBox(height: AppSize.s60), // Spacing
              Text(
                AppStrings
                    .nowLetsSetUpYourProfile, // Title: "Now let's set up your profile"
                style: getRegularStyle(
                    color: ColorManager.white, fontSize: FontSize.s32),
              ),
              const SizedBox(height: AppSize.s10), // Spacing
              Text(
                AppStrings.disclaimer, // Disclaimer text
                textAlign: TextAlign.center,
                style: getRegularStyle(
                    color: ColorManager.white, fontSize: FontSize.s18),
              ),
              const SizedBox(height: AppSize.s60), // Spacing
              buildArrowButton(), // Arrow button to navigate to the next screen
            ],
          ),
        ),
      ),
    );
  }

  // Arrow button widget
  IconButton buildArrowButton() {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: ColorManager.white,
        fixedSize: const Size(AppSize.s80, AppSize.s80), // Button size
      ),
      onPressed: () {
        Get.toNamed(Routes.condition); // Navigate to the next screen
      },
      icon: Icon(
        Icons.arrow_right_alt_rounded, // Arrow icon
        color: ColorManager.blue,
        size: AppSize.s32, // Icon size
      ),
    );
  }
}
