import 'package:flutter/material.dart';
import 'package:shopi/core/routes/app_route.dart';
import 'package:shopi/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/themes/dark.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: darkTheme(context),
          themeMode: ThemeMode.system,


          

          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: Routes.login,
        );
      },
    );
  }
}
