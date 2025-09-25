import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/constants/app_images.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/enums/nav_bar_enums.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/routes/routes.dart';
import 'package:shopi/core/widgets/custom_linear_button.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/customer/main/presentation/main%20cubit/cubit/main_cubit.dart';

class MainCustomerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MainCustomerAppBar({
    super.key,
    this.showAppBar = true, // البولين الافتراضي
  });

  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    if (!showAppBar) {
      // لو مش عايز الأوب بار، هرجع Container فاضي
      return const SizedBox.shrink();
    }

    final cubit = context.read<MainCubit>();
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.color.mainColor,
      elevation: 0,
      title: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (cubit.selectedNavBar == NavBarEnum.home) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeInLeft(
                  duration: 800,
                  child: TextApp(
                    text: context.tr(LangKeys.chooseProducts),
                    style: AppTextStyles.text20w700.copyWith(
                      color: context.color.textColor,
                    ),
                  ),
                ),
                CustomFadeInRight(
                  duration: 800,
                  child: CustomLinearButton(
                    onPressed: () {
                      context.pushName(Routes.customerSearch);
                    },
                    child: Center(child: SvgPicture.asset(AppImages.search)),
                  ),
                ),
              ],
            );
          } else if (cubit.selectedNavBar == NavBarEnum.favorites) {
            return CustomFadeInLeft(
              duration: 800,
              child: TextApp(
                text: 'Your Favorite',
                style: AppTextStyles.text20w700.copyWith(
                  color: context.color.textColor,
                ),
              ),
            );
          } else if (cubit.selectedNavBar == NavBarEnum.catgeories) {
            return CustomFadeInLeft(
              duration: 800,
              child: TextApp(
                text: 'Your Categories',
                style: AppTextStyles.text20w700.copyWith(
                  color: context.color.textColor,
                ),
              ),
            );
          } else if (cubit.selectedNavBar == NavBarEnum.notifications) {
            return CustomFadeInLeft(
              duration: 800,
              child: TextApp(
                text: 'Notifications',
                style: AppTextStyles.text20w700.copyWith(
                  color: context.color.textColor,
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, showAppBar ? 70.h : 0);
}
