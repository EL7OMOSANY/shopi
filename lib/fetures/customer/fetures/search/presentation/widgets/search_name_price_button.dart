import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/text_app.dart';

class SearchNamePriceButton extends StatelessWidget {
  const SearchNamePriceButton({
    required this.isSelected,
    required this.onTap,
    required this.title,
    super.key,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 150.w,
        decoration: BoxDecoration(
          color: isSelected
              ? context.color.textFormBorder!.withOpacity(.8)
              : context.color.containerShadow1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextApp(
            text: title,
            style: AppTextStyles.text14w700.copyWith(
              color: isSelected
                  ? context.color.mainColor
                  : context.color.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
