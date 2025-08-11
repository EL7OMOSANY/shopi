import 'package:shopi/core/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:shopi/core/extensions/extension.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: context.color.buttonLight,
    brightness: Brightness.light,
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.light,
    ],
    useMaterial3: true,
  );
}

