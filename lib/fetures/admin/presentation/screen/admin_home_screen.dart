import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:shopi/fetures/admin/presentation/screen/admin_home_content.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreen();
}

class _AdminHomeScreen extends State<AdminHomeScreen> {
  Widget page = const DashboardScreen();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return AdminHomeContent(
            onPageChanged: (a) {
              setState(() {
                page = a;
              });
              ZoomDrawer.of(context)!.close();
            },
          );
        },
      ),
      mainScreen: page,
      borderRadius: 24,
      showShadow: true,
      slideWidth: MediaQuery.of(context).size.width * 0.85,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,

      // ignore: deprecated_member_use
      shadowLayer2Color: context.color.textColor!.withOpacity(0.3),

      // ignore: deprecated_member_use
      menuBackgroundColor: context.color.mainColor!,
    );
  }
}
