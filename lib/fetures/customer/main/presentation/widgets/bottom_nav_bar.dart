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
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 80.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              // Icons
              Column(
                children: [
                  Container(
                    height: 80.h,
                    color: context.color.navBarbg,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        height: 80.h,
                        width: 300.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: BlocBuilder<MainCubit, MainState>(
                            builder: (context, state) {
                              final cubit = context.read<MainCubit>();
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //Home Screen
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
                                  //Categories Screen
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
                                  //Favourites Screen
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
                                  //Profile Screen
                                  IconTapNavBar(
                                    icon: AppImages.profileTab,
                                    isSelected:
                                        cubit.selectedNavBar ==
                                        NavBarEnum.profile,
                                    onTap: () {
                                      cubit.selectNavBarIcon(
                                        navBarEnum: NavBarEnum.profile,
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // BackGround Icon
              Positioned(
                top: -12,
                left: -8,
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
              //Car Icon
              Positioned(
                left: 35,
                top: 17,
                child: SvgPicture.asset(
                  AppImages.carShop,
                  color: Colors.white,
                  height: 20.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
