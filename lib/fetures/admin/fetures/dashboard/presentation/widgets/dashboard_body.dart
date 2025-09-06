import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopi/core/constants/app_images.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/cubit/cubit/dashboard_cubit.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/cubit/cubit/dashboard_state.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/widgets/dashboard_contrainer.dart';

class DashBoardBody extends StatelessWidget {
  const DashBoardBody({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DashboardCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return RefreshIndicator(
            // ignore: deprecated_member_use
            color: context.color.textFormBorder!.withOpacity(.7),
            onRefresh: () async {
              cubit.getProductsNums();
              cubit.getCategoriesNums();
              cubit.getUsersNums();
            },
            child: FadeInAnimation(
              child: ListView(
                children: [
                  // Products
                  BlocBuilder<DashboardCubit, DashboardState>(
                    buildWhen: (prev, curr) =>
                        curr is ProductsLoading ||
                        curr is ProductsLoaded ||
                        curr is ProductsFailure,
                    builder: (context, state) {
                      return DashBoardContiner(
                        image: AppImages.productsDrawer,
                        number: state is ProductsLoaded ? state.products : '0',
                        title: 'Products',
                        isLoading: state is ProductsLoading,
                      );
                    },
                  ),
                  AppSpacing.v24,
                  // Categories
                  BlocBuilder<DashboardCubit, DashboardState>(
                    buildWhen: (prev, curr) =>
                        curr is CategoriesLoading ||
                        curr is CategoriesLoaded ||
                        curr is CategoriesFailure,
                    builder: (context, state) {
                      return DashBoardContiner(
                        image: AppImages.categoriesDrawer,
                        number: state is CategoriesLoaded
                            ? state.categories
                            : '0',
                        title: 'Categories',
                        isLoading: state is CategoriesLoading,
                      );
                    },
                  ),
                  AppSpacing.v24,
                  // Users
                  BlocBuilder<DashboardCubit, DashboardState>(
                    buildWhen: (prev, curr) =>
                        curr is UsersLoading ||
                        curr is UsersLoaded ||
                        curr is UsersFailure,
                    builder: (context, state) {
                      return DashBoardContiner(
                        image: AppImages.usersDrawer,
                        number: state is UsersLoaded ? state.users : '0',
                        title: 'Users',
                        isLoading: state is UsersLoading,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
