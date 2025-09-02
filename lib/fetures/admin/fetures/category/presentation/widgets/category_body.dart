import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/shimmer/loading_shimmer.dart';
import 'package:shopi/core/utils/toast_utils.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/add_category_item.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/create/create_category.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoriesCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
      child: Column(
        children: [
          //Create Category Button
          const CreateCategoryButton(),

          // Category item list
          Expanded(
            child: BlocConsumer<CategoriesCubit, CategoriesState>(
              listener: (context, state) {
                if (state is ErrorGetAllCategoryState) {
                  ToastUtils.showError(
                    context,
                    message: state.error,
                    title: 'Error',
                  );
                }
              },
              builder: (context, state) {
                return RefreshIndicator(
                  // ignore: deprecated_member_use
                  color: context.color.textFormBorder!.withOpacity(.7),
                  onRefresh: () async {
                    cubit.getAllCategories();
                  },
                  child: state is LoadingGetAllCategoryState
                      ? CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                            SliverToBoxAdapter(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return LoadingShimmer(
                                    height: 150.h,
                                    width: 100.w,
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 15.h),
                                itemCount: 10,
                              ),
                            ),
                          ],
                        )
                      : CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                            SliverToBoxAdapter(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return AddCatgeoryItem(
                                    name:
                                        cubit.categoriesList[index].name ?? "",
                                    categoryId:
                                        cubit.categoriesList[index].id ?? "",
                                    image:
                                        cubit.categoriesList[index].image ?? "",
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 15.h),
                                itemCount: cubit.categoriesList.length,
                              ),
                            ),
                          ],
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
