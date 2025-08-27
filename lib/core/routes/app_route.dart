import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/routes/routes.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/screens/category_screen.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/screens/notification_screen.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/screens/products_screen.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/screens/users_screen.dart';
import 'package:shopi/fetures/admin/presentation/screen/admin_home_screen.dart';
import 'package:shopi/fetures/auth/login/presentaion/login_cubit/login_cubit.dart';
import 'package:shopi/fetures/auth/login/presentaion/screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopi/fetures/auth/signup/presentation/logic/cubit/signup_cubit.dart';
import 'package:shopi/fetures/auth/signup/presentation/screen/signup_screen.dart';
import 'package:shopi/fetures/customer/presentation/screen/customer_home_screen.dart';

import 'package:shopi/splash_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.login:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
          settings: settings,
        );

      case Routes.register:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
          settings: settings,
        );
      case Routes.adminHome:
        return CupertinoPageRoute(
          builder: (_) => const AdminHomeScreen(),
          settings: settings,
        );

      case Routes.customerHome:
        return CupertinoPageRoute(
          builder: (_) => const CustomerHomeScreen(),
          settings: settings,
        );

      case Routes.adminHomeContent:
      case Routes.addCategory:
        return CupertinoPageRoute(
          builder: (_) => const CategoryScreen(),
          settings: settings,
        );

      case Routes.addNotification:
        return CupertinoPageRoute(
          builder: (_) => const NotificationScreen(),
          settings: settings,
        );
      case Routes.addPrducts:
        return CupertinoPageRoute(
          builder: (_) => const ProductsScreen(),
          settings: settings,
        );
      case Routes.dashboard:
        return CupertinoPageRoute(
          builder: (_) => const DashboardScreen(),
          settings: settings,
        );
      case Routes.users:
        return CupertinoPageRoute(
          builder: (_) => const UsersScreen(),
          settings: settings,
        );

      case Routes.splash:
        return CupertinoPageRoute(
          builder: (_) => const SplashScreen(),
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
        appBar: AppBar(title: const Text('Error')),
      ),
      settings: settings,
    );
  }
}
