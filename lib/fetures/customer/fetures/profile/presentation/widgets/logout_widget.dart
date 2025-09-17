import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopi/core/constants/app_images.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/dialog/dialog.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/utils/app_logout.dart';
import 'package:shopi/core/widgets/text_app.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.logout,

          // ignore: deprecated_member_use
          color: context.color.textColor,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.tr(LangKeys.logOut),
          style: AppTextStyles.text14w500.copyWith(
            color: context.color.textColor,
          ),
        ),
        const Spacer(),
        //language button
        InkWell(
          onTap: () {
            //dialog
            CustomDialog.twoButtonDialog(
              context: context,
              textBody: context.tr(LangKeys.logOutFromApp),
              textButton1: context.tr(LangKeys.yes),
              textButton2: context.tr(LangKeys.no),
              isLoading: false,
              onPressed: () async {
                await AppLogout().logout(context);
              },
            );
          },
          child: Row(
            children: [
              TextApp(
                text: context.tr(LangKeys.logOut).toLowerCase(),
                style: AppTextStyles.text18w400.copyWith(color: Colors.red),
              ),
              SizedBox(width: 5.w),
              Icon(Icons.arrow_forward_ios, color: Colors.red, size: 15),
            ],
          ),
        ),
      ],
    );
  }
}
