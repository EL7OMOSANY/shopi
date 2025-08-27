import 'package:flutter/material.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/widgets/admin_appbar.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/widgets/dashboard_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: AdminAppBar(
        title: 'DashBoard',
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
      ),
      body: DashBoardBody(),
    );
  }
}
