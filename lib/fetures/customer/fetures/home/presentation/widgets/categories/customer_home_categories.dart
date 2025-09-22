import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/screens/empty_screen.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/widgets/categories/customer_categories_list.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/widgets/categories/customer_categories_shimmer.dart';

class CustomerHomeCategories extends StatelessWidget {
  const CustomerHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesCubit = context.read<CategoriesCubit>();
    return SliverToBoxAdapter(
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return state is LoadingGetAllCategoryState
              ? CustomerCategoriesShimmer()
              : categoriesCubit.categoriesList.isEmpty
              ? const EmptyScreen()
              : CustomerCategoriesList(
                  categoreisList: categoriesCubit.categoriesList,
                );
        },
      ),
    );
  }
}
