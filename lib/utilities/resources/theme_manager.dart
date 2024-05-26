import 'package:arham_labs_assignment/utilities/resources/styles_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    colorSchemeSeed: ColorManager.white,
    useMaterial3: true,

    // colorScheme: ColorScheme.fromSeed(
    //   seedColor: ColorManager.white,
    //   surface: ColorManager.white,
    //   error: ColorManager.error,
    //   secondary: ColorManager.secondary,
    // ),
    // main colors of the app
    // primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.primaryOpacity70,
    // primaryColorDark: ColorManager.darkPrimary,
    // disabledColor: ColorManager.grey1,
    // // ripple color
    // splashColor: ColorManager.primaryOpacity70,
    // // will be used incase of disabled button for example
    // hintColor: ColorManager.grey,
    // // card view theme
    // cardTheme: CardTheme(
    //     color: ColorManager.white,
    //     shadowColor: ColorManager.grey,
    //     elevation: AppSize.s4),
    // // App bar theme
    // appBarTheme: AppBarTheme(
    //     centerTitle: true,
    //     color: ColorManager.primary,
    //     elevation: AppSize.s4,
    //     shadowColor: ColorManager.primaryOpacity70,
    //     titleTextStyle: getRegularStyle(
    //         color: ColorManager.white, fontSize: FontSize.s16)),
    // // Button theme
    // buttonTheme: ButtonThemeData(
    //     shape: const StadiumBorder(),
    //     disabledColor: ColorManager.grey1,
    //     buttonColor: ColorManager.primary,
    //     splashColor: ColorManager.primaryOpacity70),
    //
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(color: ColorManager.white),
            backgroundColor: ColorManager.secondary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),
    //
    // // Text theme
    // textTheme: TextTheme(
    //     displayLarge: getSemiBoldStyle(
    //         color: ColorManager.darkGrey, fontSize: FontSize.s16),
    //     displayMedium: getRegularStyle(
    //         color: ColorManager.white, fontSize: FontSize.s16),
    //     titleSmall: getMediumStyle(
    //         color: ColorManager.primary, fontSize: FontSize.s14),
    //     bodySmall: getRegularStyle(color: ColorManager.grey1),
    //     bodyLarge: getRegularStyle(color: ColorManager.grey)),
    // input decoration theme (text form field)
    //
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p16),
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
