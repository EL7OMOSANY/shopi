import 'package:flutter/material.dart';
import 'package:shopi/core/extensions/assets_extension.dart';
import 'package:shopi/core/extensions/color_extension.dart';
import 'package:shopi/core/langs/app_localization.dart';

extension ContextExt on BuildContext {
  //color
  MyColors get color => Theme.of(this).extension<MyColors>()!;

  // images
  MyAssets get assets => Theme.of(this).extension<MyAssets>()!;

  // style
  TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;

  //Language
  String tr(String langkey) {
    return AppLocalizations.of(this)!.translate(langkey).toString();
  }

  //global key for navigator
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  //Navigation

  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop() => Navigator.of(this).pop();
}
