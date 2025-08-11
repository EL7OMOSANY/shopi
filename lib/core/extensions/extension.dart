import 'package:flutter/cupertino.dart';
import 'package:shopi/core/extensions/assets_extension.dart';
import 'package:shopi/core/extensions/color_extension.dart';
import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  /// Navigate to page with Material animation + sould update root navigator in route

  // Future<T?> pushNamed<T>(String route, {Object? arguments}) {
  //   return Navigator.of(this).pushNamed<T>(route, arguments: arguments);
  // }

  // Future<T?> pushReplacementNamed<T>(String route, {Object? arguments}) {
  //   return Navigator.of(
  //     this,
  //   ).pushReplacementNamed<T, dynamic>(route, arguments: arguments);
  // }

  // Future<T?> pushNamedAndRemoveUntil<T>(String route, {Object? arguments}) {
  //   return Navigator.of(
  //     this,
  //   ).pushNamedAndRemoveUntil<T>(route, (route) => false, arguments: arguments);
  // }

  // void pop<T>([T? result]) {
  //   Navigator.of(this).pop(result);
  // }

  // void popUntil(String route) {
  //   Navigator.of(this).popUntil(ModalRoute.withName(route));
  // }

  // void popUntilRoot() {
  //   Navigator.of(this).popUntil((route) => route.isFirst);
  // }

  /// Navigate to page with Cupertino animation
  Future<T?> push<T>(
    Widget page, {
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) {
    return Navigator.of(this).push<T>(
      CupertinoPageRoute<T>(
        builder: (_) => page,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  Future<T?> pushReplacement<T, TO>(
    Widget page, {
    TO? result,
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) {
    return Navigator.of(this).pushReplacement<T, TO>(
      CupertinoPageRoute<T>(
        builder: (_) => page,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      ),
      result: result,
    );
  }

  Future<T?> pushAndRemoveUntil<T>(
    Widget page,
    RoutePredicate predicate, {
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) {
    return Navigator.of(this).pushAndRemoveUntil<T>(
      CupertinoPageRoute<T>(
        builder: (_) => page,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      ),
      predicate,
    );
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return Navigator.of(this).pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil<T>(newRouteName, predicate, arguments: arguments);
  }

  Future<bool> maybePop<T extends Object?>([T? result]) {
    return Navigator.of(this).maybePop<T>(result);
  }

  bool canPop() {
    return Navigator.of(this).canPop();
  }

  MyAssets get asset => Theme.of(this).extension<MyAssets>()!;

  MyColors get color => Theme.of(this).extension<MyColors>()!;
  
}
