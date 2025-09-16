import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/extensions/string_extentions.dart';
import 'package:shopi/core/widgets/text_app.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({
    super.key,
    required this.userImage,
    required this.userName,
    required this.userEmail,
  });

  final String userImage;
  final String userName;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // user profile image
        CircleAvatar(
          radius: 60.r,
          child: Image.asset(
            height: 80.h,
            width: 80.w,
            fit: BoxFit.fill,
            userImage,
          ),
        ),
        AppSpacing.v16,
        TextApp(
          text: userName.toLowerCase().toCapitalized(),
          style: AppTextStyles.text24w400.copyWith(
            color: context.color.textColor,
          ),
        ),
        AppSpacing.v8,
        TextApp(
          text: userEmail,
          style: AppTextStyles.text18w400.copyWith(
            color: context.color.textColor,
          ),
        ),
        AppSpacing.v8,
        Divider(
          color: context.color.textColor,
          thickness: .5.w,
          endIndent: 40.w,
          indent: 40.w,
        ),
      ],
    );
  }
}
