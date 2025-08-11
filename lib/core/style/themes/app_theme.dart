import 'package:flutter/material.dart';
import 'package:shopi/core/extensions/assets_extension.dart';
import 'package:shopi/core/extensions/color_extension.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/core/style/colors/light_colors.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark, MyAssets.dark],
    useMaterial3: true,
    textTheme: TextTheme(
      // displaySmall: TextStyle(
      //   fontSize: 14,
      //   color: ColorsDark.white,
      //   fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      // ),
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.light, MyAssets.light],
    useMaterial3: true,
    textTheme: TextTheme(
      // displaySmall: TextStyle(
      //   fontSize: 14,
      //   color: ColorsLight.black,
      //   fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      // ),
    ),
  );
}
