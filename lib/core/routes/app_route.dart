import 'package:shopi/core/routes/routes.dart';
import 'package:shopi/fetures/auth/login/presentaion/screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopi/fetures/auth/signup/presentation/screen/signup_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.login:
        return CupertinoPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );

      case Routes.register:
        return CupertinoPageRoute(
          builder: (_) => const SignupScreen(),
          settings: settings,
        );

      default:
        return _errorRoute(settings);
    }
  }

  static List<Route<dynamic>> onGenerateInitialRoutes(
    NavigatorState navigator,
    String initialRoute,
  ) {
    return [onGenerateRoute(RouteSettings(name: initialRoute))];
  }

  static Route<dynamic> _errorRoute(RouteSettings settings) {
    return CupertinoPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            'Routing Error: No route defined for ${settings.name} or arguments are invalid.',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
      settings: settings,
    );
  }
}
