import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/utils/admin_drawer_list.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/widgets/admin_appbar.dart';

class AdminHomeContent extends StatelessWidget {
  const AdminHomeContent({required this.onPageChanged, super.key});

  final void Function(Widget) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 150.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Admin Panel',
              style: TextStyle(
                color: context.color.textColor!,
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacing.v40,

            Column(
              children: adminDrawerList(context)
                  .map(
                    (e) => ListTile(
                      onTap: () {
                        onPageChanged(e.page);
                      },
                      title: e.title,
                      leading: e.icon,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
