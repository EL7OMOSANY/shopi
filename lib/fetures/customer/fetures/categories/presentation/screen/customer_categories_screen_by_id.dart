import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/widgets/custom_app_bar.dart';
import 'package:shopi/fetures/customer/fetures/categories/presentation/cubit/products_by_category_id_cubit.dart';
import 'package:shopi/fetures/customer/fetures/categories/presentation/widgets/category_body_by_id.dart';

class CustomerCategoriesScreenById extends StatelessWidget {
  const CustomerCategoriesScreenById({super.key, required this.categoryInfo});

  final ({String categoryName, int categoryId}) categoryInfo;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProductsByCategoryIdCubit>()
            ..getProductsByCategoryId(categoryId: categoryInfo.categoryId),
      child: Scaffold(
        appBar: CustomAppBar(title: categoryInfo.categoryName),
        body: const CustomerCategoryBodyById(),
      ),
    );
  }
}
