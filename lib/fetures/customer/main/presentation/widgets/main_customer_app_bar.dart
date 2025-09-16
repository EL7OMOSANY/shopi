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
import 'package:shopi/core/widgets/custom_linear_button.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/customer/main/presentation/main%20cubit/cubit/main_cubit.dart';

class MainCustomerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MainCustomerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                CustomFadeInRight(
                  duration: 800,
                  child: TextApp(
                    text: context.tr(LangKeys.chooseProducts),
                    style: AppTextStyles.text20w700.copyWith(
                      color: context.color.textColor,
                    ),
                  ),
                ),
                CustomFadeInLeft(
                  duration: 800,
                  child: CustomLinearButton(
                    onPressed: () {
                      // context.pushName(Routes.search);
                    },
                    child: Center(child: SvgPicture.asset(AppImages.search)),
                  ),
                ),
              ],
            );
          } else if (cubit.selectedNavBar == NavBarEnum.favorites) {
            return CustomFadeInRight(
              duration: 800,
              child: TextApp(
                text: 'Your Favorite',
                style: AppTextStyles.text20w700.copyWith(
                  color: context.color.textColor,
                ),
              ),
            );
          } else if (cubit.selectedNavBar == NavBarEnum.notifications) {
            return CustomFadeInRight(
              duration: 800,
              child: TextApp(
                text: 'Notifications',
                style: AppTextStyles.text20w700.copyWith(
                  color: context.color.textColor,
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
