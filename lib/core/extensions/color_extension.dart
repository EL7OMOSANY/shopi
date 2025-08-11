// import 'package:flutter/material.dart';

// class MyColors extends ThemeExtension<MyColors> {
//   final Color mainColor;
//   final Color blueLight;
//   final Color blueDark;
//   final Color navBarColor;
//   final Color white;
//   final Color black1;
//   final Color black2;

//   const MyColors({
//     required this.mainColor,
//     required this.blueLight,
//     required this.blueDark,
//     required this.navBarColor,
//     required this.white,
//     required this.black1,
//     required this.black2,
//   });

//   // نسخة الثيم الداكن
//   static const dark = MyColors(
//     mainColor: Color(0xFF242C3B),
//     blueLight: Color(0xFF37B6E9),
//     blueDark: Color(0xFF4B4CED),
//     navBarColor: Color(0xff2b3361),
//     white: Color(0xFFFFFFFF),
//     black1: Color(0xff353F54),
//     black2: Color(0xff222834),
//   );

//   // نسخة الثيم الفاتح
//   static const light = MyColors(
//     mainColor: Color(0xffFFFFFF),
//     blueLight: Color(0xFFEE637A),
//     blueDark: Color(0xFF99162B),
//     navBarColor: Color(0xffF1F1F1),
//     white: Color(0xffFFFFFF),
//     black1: Color(0xff170605),
//     black2: Color(0xff333333),
//   );

//   @override
//   MyColors copyWith({
//     Color? mainColor,
//     Color? blueLight,
//     Color? blueDark,
//     Color? navBarColor,
//     Color? white,
//     Color? black1,
//     Color? black2,
//   }) {
//     return MyColors(
//       mainColor: mainColor ?? this.mainColor,
//       blueLight: blueLight ?? this.blueLight,
//       blueDark: blueDark ?? this.blueDark,
//       navBarColor: navBarColor ?? this.navBarColor,
//       white: white ?? this.white,
//       black1: black1 ?? this.black1,
//       black2: black2 ?? this.black2,
//     );
//   }

//   @override
//   MyColors lerp(ThemeExtension<MyColors>? other, double t) {
//     if (other is! MyColors) return this;
//     return MyColors(
//       mainColor: Color.lerp(mainColor, other.mainColor, t)!,
//       blueLight: Color.lerp(blueLight, other.blueLight, t)!,
//       blueDark: Color.lerp(blueDark, other.blueDark, t)!,
//       navBarColor: Color.lerp(navBarColor, other.navBarColor, t)!,
//       white: Color.lerp(white, other.white, t)!,
//       black1: Color.lerp(black1, other.black1, t)!,
//       black2: Color.lerp(black2, other.black2, t)!,
//     );
//   }

//   // Helper: تجيب الـ MyColors من الـ context
//   static MyColors of(BuildContext context) {
//     return Theme.of(context).extension<MyColors>()!;
//   }
// }

import 'package:flutter/material.dart';

class MyColors extends ThemeExtension<MyColors> {
  final Color mainColor;
  final Color blueLight;
  final Color blueDark;
  final Color navBarColor;
  final Color white;
  final Color black1;
  final Color black2;
  final Color pinkLight;
  final Color pinkDark;
  final Color black;
  final Color buttonLight;
  final Color buttonDark;
  final Color border;

  const MyColors({
    required this.border,
    required this.buttonLight,
    required this.buttonDark,
    required this.mainColor,
    required this.blueLight,
    required this.blueDark,
    required this.navBarColor,
    required this.white,
    required this.black1,
    required this.black2,
    required this.pinkLight,
    required this.pinkDark,
    required this.black,
  });

  /// نسخة الثيم الداكن
  static const dark = MyColors(
    mainColor: Color(0xFF242C3B),
    blueLight: Color(0xFF37B6E9),
    blueDark: Color(0xFF4B4CED),
    navBarColor: Color(0xff2b3361),
    white: Color(0xFFFFFFFF),
    black1: Color(0xff353F54),
    black2: Color(0xff222834),
    pinkLight: Color(0xFF37B6E9), // مش مستخدم في الدارك، حطيت قيمة مؤقتة
    pinkDark: Color(0xFF4B4CED), // مش مستخدم في الدارك، حطيت قيمة مؤقتة
    black: Color(0xff000000),
    buttonLight: Color(0xFF37B6E9),
    buttonDark: Color(0xFF4B4CED),
    border: Color(0xFF4B4CED),
  );

  /// نسخة الثيم الفاتح
  static const light = MyColors(
    mainColor: Color(0xffFFFFFF),
    blueLight: Color(0xFF37B6E9), // ممكن تعدل لو ليه لون تاني في الفاتح
    blueDark: Color(0xFF4B4CED), // ممكن تعدل لو ليه لون تاني في الفاتح
    navBarColor: Color(0xffF1F1F1),
    white: Color(0xffFFFFFF),
    black1: Color(0xff353F54), // لو محتاج نفس البلاك1
    black2: Color(0xff222834), // لو محتاج نفس البلاك2
    pinkLight: Color(0xFFEE637A),
    pinkDark: Color(0xFF99162B),
    black: Color(0xff170605),
    buttonLight: Color(0xFFEE637A),
    buttonDark: Color(0xFF99162B),
    border: Color(0xFF99162B),
  );

  @override
  MyColors copyWith({
    Color? mainColor,
    Color? blueLight,
    Color? blueDark,
    Color? navBarColor,
    Color? white,
    Color? black1,
    Color? black2,
    Color? pinkLight,
    Color? pinkDark,
    Color? black,
  }) {
    return MyColors(
      mainColor: mainColor ?? this.mainColor,
      blueLight: blueLight ?? this.blueLight,
      blueDark: blueDark ?? this.blueDark,
      navBarColor: navBarColor ?? this.navBarColor,
      white: white ?? this.white,
      black1: black1 ?? this.black1,
      black2: black2 ?? this.black2,
      pinkLight: pinkLight ?? this.pinkLight,
      pinkDark: pinkDark ?? this.pinkDark,
      black: black ?? this.black,
      buttonLight: buttonLight,
      buttonDark: buttonDark,
      border: border,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) return this;
    return MyColors(
      mainColor: Color.lerp(mainColor, other.mainColor, t)!,
      blueLight: Color.lerp(blueLight, other.blueLight, t)!,
      blueDark: Color.lerp(blueDark, other.blueDark, t)!,
      navBarColor: Color.lerp(navBarColor, other.navBarColor, t)!,
      white: Color.lerp(white, other.white, t)!,
      black1: Color.lerp(black1, other.black1, t)!,
      black2: Color.lerp(black2, other.black2, t)!,
      pinkLight: Color.lerp(pinkLight, other.pinkLight, t)!,
      pinkDark: Color.lerp(pinkDark, other.pinkDark, t)!,
      black: Color.lerp(black, other.black, t)!,
      buttonLight: Color.lerp(buttonLight, other.buttonLight, t)!,
      buttonDark: Color.lerp(buttonDark, other.buttonDark, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }

  /// Helper: ترجع نسخة MyColors من الكونتكست
  static MyColors of(BuildContext context) {
    return Theme.of(context).extension<MyColors>()!;
  }
}
