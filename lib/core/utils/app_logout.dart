import 'package:flutter/widgets.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/routes/routes.dart';

class AppLogout {
  factory AppLogout() {
    return _instance;
  }

  AppLogout._();

  static final AppLogout _instance = AppLogout._();

  Future<void> logout(BuildContext context) async {
    await SharedPref().clearPreferences();
    // ignore: use_build_context_synchronously
    context.pushNamedAndRemoveUntil(Routes.login);
  }
}
