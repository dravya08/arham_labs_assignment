import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#FFFFFF");
  static Color secondary = HexColor.fromHex("#4166C6");
  static Color splashColor = HexColor.fromHex("#F0F4FF");
  static Color blue = HexColor.fromHex("#142B66");

  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black = HexColor.fromHex("#000000"); // red color

  static Color textColor1 = HexColor.fromHex("#747997");

  static Color cardColor1 = HexColor.fromHex("#F1F2F5");
  static Color cardColor2 = HexColor.fromHex("#C7C9D5");

  static Color borderColor1 = HexColor.fromHex("#F1F2F5");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
