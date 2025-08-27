import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/widgets/text_app.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdminAppBar({
    required this.isMain,
    required this.backgroundColor,
    required this.title,
    super.key,
  });

  final bool isMain;
  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: TextApp(
        text: title,
        style: AppTextStyles.text18w700.copyWith(color: Colors.white),
      ),
      leading: isMain
          ? IconButton(
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
              icon: const Icon(Icons.menu, color: Colors.white),
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50.h);
}
