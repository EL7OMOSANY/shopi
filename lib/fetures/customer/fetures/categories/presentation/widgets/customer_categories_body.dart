import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/screens/empty_screen.dart';
import 'package:shopi/core/shimmer/loading_shimmer.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/customer/fetures/categories/presentation/widgets/custom_customer_category_item.dart';

class CustomerCategoriesBody extends StatelessWidget {
  const CustomerCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          final categoryList = context.read<CategoriesCubit>().categoriesList;
          return state is LoadingGetAllCategoryState
              ? GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //Number of cloums
                    crossAxisSpacing: 8, // Spacing between colums
                    mainAxisSpacing: 15, //Spacing between rows
                    childAspectRatio: 165 / 250,
                  ),
                  itemBuilder: (context, index) {
                    return LoadingShimmer(height: 250.h, width: 165.w);
                  },
                )
              : state is ErrorGetAllCategoryState && categoryList.isEmpty
              ? Center(child: Text(state.error))
              : categoryList.isEmpty
              ? const EmptyScreen()
              : GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: categoryList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //Number of cloums
                    crossAxisSpacing: 8, // Spacing between colums
                    mainAxisSpacing: 15, //Spacing between rows
                    childAspectRatio: 165 / 250,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCustomerCategoryItem(
                      image: categoryList[index].image ?? '',
                      name: categoryList[index].name ?? '',
                    );
                  },
                );
        },
      ),
    );
  }
}
