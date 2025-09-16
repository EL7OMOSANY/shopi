import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopi/core/constants/app_images.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/widgets/text_app.dart';

class BuildVersion extends StatelessWidget {
  const BuildVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.buildVersion,
          // ignore: deprecated_member_use
          color: context.color.textColor,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.tr(LangKeys.buildVersion),
          style: AppTextStyles.text14w500.copyWith(
            color: context.color.textColor,
          ),
        ),
        const Spacer(),
        //Build Version

        // FutureBuilder<String>(
        //   future: AppInfo.getAppVersion(context),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return TextApp(
        //         text: snapshot.data.toString(),
        //         theme: context.textStyle.copyWith(
        //           fontSize: 16.sp,
        //           fontWeight: FontWeightHelper.regular,
        //         ),
        //       );
        //     } else {
        //       return const SizedBox.shrink();
        //     }
        //   },
        // ),
      ],
    );
  }
}
