import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/app/app_cubit/app_cubit.dart';
import 'package:shopi/core/app/app_cubit/app_state.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/langs/app_localizations_setup.dart';
import 'package:shopi/core/routes/app_route.dart';
import 'package:shopi/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/style/themes/app_theme.dart';

class Shopi extends StatelessWidget {
  const Shopi({super.key});

  @override
  Widget build(BuildContext context) {
    String token = SharedPref().getString(SharedPrefKeys.accessToken) ?? '';
    String role = SharedPref().getString(SharedPrefKeys.userRole) ?? '';
    return BlocProvider(
      create: (context) => getIt<AppCubit>()
        ..changeAppTheme(
          sharedTheme: SharedPref().getBoolean(SharedPrefKeys.isDark) ?? false,
        )
        ..getSavedLanguage(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return BlocBuilder<AppCubit, AppState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              final cubit = context.read<AppCubit>();
              return MaterialApp(
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                locale: Locale(cubit.currentLang),
                debugShowCheckedModeBanner: false,
                theme: cubit.isDark ? themeLight() : themeDark(),
                onGenerateRoute: AppRouter.onGenerateRoute,
                // ignore: unnecessary_null_comparison
                initialRoute: token.isEmpty || token == "" || token == null
                    ? Routes.splash
                    : role == 'admin'
                    ? Routes.adminHome
                    : Routes.customerHome,
              );
            },
          );
        },
      ),
    );
  }
}
