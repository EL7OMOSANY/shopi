import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/widgets/custom_linear_button.dart';
import 'package:shopi/core/widgets/text_app.dart';

class LangAndThemeRow extends StatelessWidget {
  const LangAndThemeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomLinearButton(
          onPressed: () {},
          child: SvgPicture.asset(
            'assets/svgs/dark_mode.svg',
            height: 20,
            width: 20,
          ),
        ),
        CustomLinearButton(
          width: 100.w,
          onPressed: () {},
          child: TextApp(text: 'العربية', style: AppTextStyles.text14w500),
        ),
      ],
    );
  }
}
