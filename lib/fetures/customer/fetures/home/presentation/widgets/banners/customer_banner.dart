import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/shimmer/loading_shimmer.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/cubit/cubit/customer_home_cubit.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/widgets/banners/banner_sliders.dart';

class CustomerBanner extends StatelessWidget {
  const CustomerBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final customerHomeCubit = context.read<CustomerHomeCubit>();

    return SliverToBoxAdapter(
      child: BlocBuilder<CustomerHomeCubit, CustomerHomeState>(
        builder: (context, state) {
          return state is CustomerHomeBannersLoading
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: LoadingShimmer(
                    height: 160.h,
                    width: MediaQuery.of(context).size.width,
                  ),
                )
              : state is CustomerHomeBannersSuccess
              ? BannerSliders(bannersList: customerHomeCubit.bannersImageList)
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    "There is no Banners ,Keep tuning...",
                    style: AppTextStyles.text16w500.copyWith(
                      color: context.color.textColor,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
