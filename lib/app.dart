import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/app/app_cubit/app_cubit.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/routes/app_route.dart';
import 'package:shopi/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/style/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppCubit>()
        ..changeAppThemeMode(
          sharedMode: SharedPref().getBoolean(SharedPrefKeys.isDark),
        ),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return BlocBuilder<AppCubit, AppState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              final cubit = context.read<AppCubit>();
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: cubit.isDark ? themeLight() : themeDark(),
                themeMode: ThemeMode.system,
                onGenerateRoute: AppRouter.onGenerateRoute,
                initialRoute: Routes.login,
              );
            },
          );
        },
      ),
    );
  }
}
