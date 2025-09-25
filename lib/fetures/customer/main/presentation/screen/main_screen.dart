import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/enums/nav_bar_enums.dart';
import 'package:shopi/fetures/customer/fetures/categories/presentation/screen/customer_categories_screen.dart';
import 'package:shopi/fetures/customer/fetures/favorits/presentation/screen/customer_favorites_screen.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/screen/customer_home_screen.dart';
import 'package:shopi/fetures/customer/fetures/notifications/presentation/screen/customer_notifications_screen.dart';
import 'package:shopi/fetures/customer/fetures/profile/presentation/screen/customer_profile_screen.dart';
import 'package:shopi/fetures/customer/main/presentation/main%20cubit/cubit/main_cubit.dart';
import 'package:shopi/fetures/customer/main/presentation/widgets/bottom_nav_bar.dart';
import 'package:shopi/fetures/customer/main/presentation/widgets/main_customer_app_bar.dart';
// import 'package:shopi/fetures/customer/main/presentation/widgets/main_customer_app_bar.dart';

class CustomerMainScreen extends StatelessWidget {
  const CustomerMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainCubit>(),
      child: Scaffold(
        appBar: const MainCustomerAppBar(),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<MainCubit, MainState>(
                builder: (context, state) {
                  final cubit = context.read<MainCubit>();
                  if (cubit.selectedNavBar == NavBarEnum.notifications) {
                    return const CustomerNotificationsScreen();
                  } else if (cubit.selectedNavBar == NavBarEnum.favorites) {
                    return const CustomerFavoritsScreen();
                  } else if (cubit.selectedNavBar == NavBarEnum.profile) {
                    return const CustomerProfileScreen();
                  } else if (cubit.selectedNavBar == NavBarEnum.catgeories) {
                    return const CustomerCategoriesScreen();
                  } else {
                    return const CustomerHomeScreen();
                  }
                },
              ),
            ),
            const MainBottomNavBar(),
          ],
        ),
      ),
    );
  }
}
