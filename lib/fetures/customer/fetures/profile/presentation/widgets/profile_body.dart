import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/customer/fetures/profile/presentation/widgets/build_developer.dart';
import 'package:shopi/fetures/customer/fetures/profile/presentation/widgets/build_version.dart';
import 'package:shopi/fetures/customer/fetures/profile/presentation/widgets/dark_mode_change.dart';
import 'package:shopi/fetures/customer/fetures/profile/presentation/widgets/language_change.dart';
import 'package:shopi/fetures/customer/fetures/profile/presentation/widgets/logout_widget.dart';
import 'package:shopi/fetures/customer/fetures/profile/presentation/widgets/user_profile_info.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //User Profile Info
            Center(
              child: UserProfileInfo(
                userImage:
                    SharedPref().getString(SharedPrefKeys.userImage) ??
                    "assets/images/core/def_user.png",
                userName:
                    SharedPref().getString(SharedPrefKeys.userName) ?? "User",
                userEmail:
                    SharedPref().getString(SharedPrefKeys.userEmail) ??
                    "User@gmail.com",
              ),
            ),

            //title
            SizedBox(height: 20.h),
            CustomFadeInRight(
              duration: 400,
              child: TextApp(
                text: context.tr(LangKeys.applicationFeatures),
                style: AppTextStyles.text18w700.copyWith(
                  color: context.color.textColor,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            // language
            const CustomFadeInRight(duration: 400, child: LanguageChange()),
            SizedBox(height: 20.h),
            // dark mode
            const CustomFadeInRight(duration: 400, child: DarkModeChange()),
            SizedBox(height: 20.h),
            // Build Developer
            const CustomFadeInRight(duration: 400, child: BuildDeveloper()),
            SizedBox(height: 20.h),
            // Notifications change
            // const CustomFadeInRight(
            //   duration: 400,
            //   child: NotificationsChange(),
            // ),
            // SizedBox(height: 20.h),
            // Build Version
            const CustomFadeInRight(duration: 400, child: BuildVersion()),
            SizedBox(height: 20.h),
            // Logout
            const CustomFadeInRight(duration: 400, child: LogOutWidget()),
          ],
        ),
      ),
    );
  }
}
