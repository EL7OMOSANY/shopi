import 'package:flutter/material.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/utils/app_logout.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/core/dialog/dialog.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/screens/category_screen.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/screens/notifications_screen.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/screens/products_screen.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/screens/users_screen.dart';

List<DrawerItemModel> adminDrawerList(BuildContext context) {
  return <DrawerItemModel>[
    //DashBoard
    DrawerItemModel(
      icon: const Icon(Icons.dashboard, color: Colors.white),
      title: TextApp(
        text: 'DashBoard',
        style: AppTextStyles.text16w500.copyWith(color: Colors.white),
      ),
      page: const DashboardScreen(),
    ),
    //Categories
    DrawerItemModel(
      icon: const Icon(Icons.category_outlined, color: Colors.white),
      title: TextApp(
        text: 'Categories',
        style: AppTextStyles.text16w500.copyWith(color: Colors.white),
      ),
      page: const CategoryScreen(),
    ),
    //Product
    DrawerItemModel(
      icon: const Icon(Icons.production_quantity_limits, color: Colors.white),
      title: TextApp(
        text: 'Products',
        style: AppTextStyles.text16w500.copyWith(color: Colors.white),
      ),
      page: const ProductsScreen(),
    ),
    //Users
    DrawerItemModel(
      icon: const Icon(Icons.people_alt_rounded, color: Colors.white),
      title: TextApp(
        text: 'Users',
        style: AppTextStyles.text16w500.copyWith(color: Colors.white),
      ),
      page: const UsersScreen(),
    ),
    //Notifications
    DrawerItemModel(
      icon: const Icon(Icons.notifications_active, color: Colors.white),
      title: TextApp(
        text: 'Notifications',
        style: AppTextStyles.text16w500.copyWith(color: Colors.white),
      ),
      page: const NotificationScreen(),
    ),
    //LogOut
    DrawerItemModel(
      icon: const Icon(Icons.exit_to_app, color: Colors.white),
      title: GestureDetector(
        onTap: () {
          CustomDialog.twoButtonDialog(
            context: context,
            textBody: 'Do you want log out?',
            textButton1: 'Yes',
            textButton2: 'No',
            isLoading: false,
            onPressed: () async {
              await AppLogout().logout(context);
            },
          );
        },
        child: Text(
          'Logout',
          style: AppTextStyles.text16w500.copyWith(color: Colors.white),
        ),
      ),
      page: const UsersScreen(),
    ),
  ];
}

class DrawerItemModel {
  DrawerItemModel({
    required this.icon,
    required this.title,
    required this.page,
  });

  final Icon icon;
  final Widget title;
  final Widget page;
}
