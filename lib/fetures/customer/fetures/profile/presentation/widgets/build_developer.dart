import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopi/core/constants/app_images.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/widgets/text_app.dart';

class BuildDeveloper extends StatelessWidget {
  const BuildDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.buildDeveloper,
          // ignore: deprecated_member_use
          color: context.color.textColor,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.tr(LangKeys.buildDeveloper),
          style: AppTextStyles.text14w500.copyWith(
            color: context.color.textColor,
          ),
        ),
        const Spacer(),
        //language button
        InkWell(
          onTap: () {
            //Open Web View
            // context.pushName(
            //   Routes.webview,
            //   arguments: EnvVariable.instance.buildDeveloper,
            // );
          },
          child: Row(
            children: [
              TextApp(
                text: 'Shoopi Store',
                style: AppTextStyles.text14w500.copyWith(
                  color: context.color.textColor,
                ),
              ),
              SizedBox(width: 5.w),
              Icon(
                Icons.arrow_forward_ios,
                color: context.color.textColor,
                size: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
