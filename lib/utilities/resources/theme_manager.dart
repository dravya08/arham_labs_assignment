import 'package:arham_labs_assignment/utilities/resources/styles_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    colorSchemeSeed: ColorManager.white,
    useMaterial3: true,

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(color: ColorManager.white),
            backgroundColor: ColorManager.secondary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p20),
      // hint style
      hintStyle: getRegularStyle(color: ColorManager.black),

      // label style
      labelStyle: getMediumStyle(color: ColorManager.black),

      // error style
      errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.black, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10))),

      // focused border
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.secondary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10))),

      // error border
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10))),
      // focused error border
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10))),
    ),
  );
}
