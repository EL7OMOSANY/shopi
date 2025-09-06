import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/widgets/text_app.dart';

class TableCellTitleWidget extends StatelessWidget {
  const TableCellTitleWidget({
    required this.icon,
    required this.title,
    super.key,
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          SizedBox(width: 5.w),
          TextApp(
            text: title,
            style: AppTextStyles.text16w400.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
