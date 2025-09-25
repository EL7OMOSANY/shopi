import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/text_app.dart';

class SearchFormDataIcon extends StatelessWidget {
  const SearchFormDataIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.search_sharp, color: context.color.textColor, size: 150),
        SizedBox(height: 10.h),
        TextApp(
          text: 'Search For Data',
          style: AppTextStyles.text18w700.copyWith(
            color: context.color.textColor,
          ),
        ),
      ],
    );
  }
}
