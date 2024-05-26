import 'dart:async';

import 'package:arham_labs_assignment/utilities/resources/font_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/routes_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/strings_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/styles_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utilities/resources/assets_manager.dart';
import '../../utilities/resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    Get.offNamed(Routes.getStarted);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.splashColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImageAssets.splashLogo,
            ),
            const SizedBox(height: AppSize.s40),
            Text(
              AppStrings.splashTitle1,
              style: getMediumStyle(
                  color: ColorManager.black, fontSize: FontSize.s24),
            ),
            const SizedBox(height: AppSize.s8),
            Text(
              AppStrings.splashTitle2,
              style: getRegularStyle(
                  color: ColorManager.textColor1, fontSize: FontSize.s16),
            ),
          ],
        ),
      ),
    );
  }
}
