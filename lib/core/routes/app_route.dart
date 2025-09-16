import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/app/upload_image_cubit/upload_image_cubit.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/routes/routes.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/screens/category_screen.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/screens/notifications_screen.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/screens/products_screen.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/screens/users_screen.dart';
import 'package:shopi/fetures/admin/presentation/screen/admin_home_screen.dart';
import 'package:shopi/fetures/auth/login/presentaion/login_cubit/login_cubit.dart';
import 'package:shopi/fetures/auth/login/presentaion/screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopi/fetures/auth/signup/presentation/logic/cubit/signup_cubit.dart';
import 'package:shopi/fetures/auth/signup/presentation/screen/signup_screen.dart';
import 'package:shopi/fetures/customer/fetures/categories/presentation/screen/customer_categories_screen.dart';
import 'package:shopi/fetures/customer/fetures/chart/presentation/screen/customer_chart_screen.dart';
import 'package:shopi/fetures/customer/fetures/favorits/presentation/screen/customer_favorits_screen.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/screen/customer_home_screen.dart';
import 'package:shopi/fetures/customer/fetures/notifications/presentation/screen/customer_notifications_screen.dart';
import 'package:shopi/fetures/customer/fetures/profile/presentation/screen/customer_profile_screen.dart';
import 'package:shopi/fetures/customer/main/presentation/screen/main_screen.dart';

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

      case Routes.customerMain:
        return CupertinoPageRoute(
          builder: (_) => const CustomerMainScreen(),
          settings: settings,
        );
      case Routes.customerHome:
        return CupertinoPageRoute(
          builder: (_) => const CustomerHomeScreen(),
          settings: settings,
        );
      case Routes.customerChart:
        return CupertinoPageRoute(
          builder: (_) => const CustomerChartScreen(),
          settings: settings,
        );
      case Routes.customerCategories:
        return CupertinoPageRoute(
          builder: (_) => const CustomerCategoriesScreen(),
          settings: settings,
        );
      case Routes.customerFavorits:
        return CupertinoPageRoute(
          builder: (_) => const CustomerFavoritsScreen(),
          settings: settings,
        );
      case Routes.customerNotifications:
        return CupertinoPageRoute(
          builder: (_) => const CustomerNotificationsScreen(),
          settings: settings,
        );
      case Routes.customerProfile:
        return CupertinoPageRoute(
          builder: (_) => const CustomerProfileScreen(),
          settings: settings,
        );

      case Routes.adminHomeContent:
      case Routes.addCategory:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<UploadImageCubit>(),
            child: const CategoryScreen(),
          ),
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
