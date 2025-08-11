import 'package:shopi/core/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:shopi/core/extensions/extension.dart';

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: context.color.blueDark, 
    brightness: Brightness.dark,
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.dark,
    ],
    useMaterial3: true,
  );
}

