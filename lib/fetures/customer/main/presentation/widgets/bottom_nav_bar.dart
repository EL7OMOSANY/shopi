import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/constants/app_images.dart';
import 'package:shopi/core/enums/nav_bar_enums.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/fetures/customer/main/presentation/main%20cubit/cubit/main_cubit.dart';
import 'package:shopi/fetures/customer/main/presentation/widgets/icon_tap_nav_bar.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 800,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(),
          height: 80.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // NavBar background
              Container(
                height: 80.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: context.color.textFormBorder!,
                    width: 2.5.w,
                  ),

                  gradient: LinearGradient(
                    colors: [
                      context.color.navBarbg!,
                      // ignore: deprecated_member_use
                      context.color.textFormBorder!.withOpacity(0.5),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                ),
              ),

              // BackGround Icon (in center)
              Positioned(
                top: -5, // مرفوع فوق شوية
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(context.assets.bigNavBar!),
                    ),
                  ),
                ),
              ),

              // Car Icon (centered on top of background)
              Positioned(
                top: 18.h, // مرفوع فوق شوية
                child: SvgPicture.asset(
                  AppImages.carShop,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                  height: 25.h,
                ),
              ),

              // Icons Row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: BlocBuilder<MainCubit, MainState>(
                  builder: (context, state) {
                    final cubit = context.read<MainCubit>();
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 2 Icons Left
                          Row(
                            children: [
                              IconTapNavBar(
                                icon: AppImages.homeTab,
                                isSelected:
                                    cubit.selectedNavBar == NavBarEnum.home,
                                onTap: () {
                                  cubit.selectNavBarIcon(
                                    navBarEnum: NavBarEnum.home,
                                  );
                                },
                              ),
                              SizedBox(width: 45.w),
                              IconTapNavBar(
                                icon: AppImages.categoriesTab,
                                isSelected:
                                    cubit.selectedNavBar ==
                                    NavBarEnum.catgeories,
                                onTap: () {
                                  cubit.selectNavBarIcon(
                                    navBarEnum: NavBarEnum.catgeories,
                                  );
                                },
                              ),
                            ],
                          ),

                          // 2 Icons Right
                          Row(
                            children: [
                              IconTapNavBar(
                                icon: AppImages.favouritesTab,
                                isSelected:
                                    cubit.selectedNavBar ==
                                    NavBarEnum.favorites,
                                onTap: () {
                                  cubit.selectNavBarIcon(
                                    navBarEnum: NavBarEnum.favorites,
                                  );
                                },
                              ),
                              SizedBox(width: 45.w),
                              IconTapNavBar(
                                icon: AppImages.profileTab,
                                isSelected:
                                    cubit.selectedNavBar == NavBarEnum.profile,
                                onTap: () {
                                  cubit.selectNavBarIcon(
                                    navBarEnum: NavBarEnum.profile,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
