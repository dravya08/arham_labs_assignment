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
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppSize.s100),
              SvgPicture.asset(ImageAssets.starWhite),
              SizedBox(height: AppSize.s60),
              Text(
                AppStrings.nowLetsSetUpYourProfile,
                style: getRegularStyle(
                    color: ColorManager.white, fontSize: FontSize.s32),
              ),
              SizedBox(height: AppSize.s10),
              Text(
                textAlign: TextAlign.center,
                AppStrings.disclaimer,
                style: getRegularStyle(
                    color: ColorManager.white, fontSize: FontSize.s18),
              ),
              SizedBox(height: AppSize.s60),
              IconButton(
                  style: IconButton.styleFrom(
                      backgroundColor: ColorManager.white,
                      fixedSize: Size(AppSize.s80, AppSize.s80)),
                  onPressed: () {
                    Get.toNamed(Routes.condition);
                  },
                  icon: Icon(
                    Icons.arrow_right_alt_rounded,
                    color: ColorManager.blue,
                    size: AppSize.s32,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
