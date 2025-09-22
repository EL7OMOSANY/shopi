import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/cubit/cubit/customer_home_cubit.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/widgets/banners/customer_banner.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/widgets/categories/customer_home_categories.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/widgets/products/customer_home_products.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/widgets/view_all_products_button.dart';

class CustomerHomeBody extends StatelessWidget {
  const CustomerHomeBody({required this.scrollCOntroller, super.key});

  final ScrollController scrollCOntroller;

  @override
  Widget build(BuildContext context) {
    final customerHomeCubit = context.read<CustomerHomeCubit>();
    final categoriesCubit = context.read<CategoriesCubit>();
    final productsCubit = context.read<ProductsCubit>();
    return RefreshIndicator(
      onRefresh: () async {
        customerHomeCubit.getBanners();
        categoriesCubit.getAllCategories();
        productsCubit.getAllProducts();
      },
      child: CustomScrollView(
        controller: scrollCOntroller,
        slivers: [
          //Banners
          CustomerBanner(),
          //all Caegories
          CustomerHomeCategories(),
          //all Products
          CustomerHomeProducts(),
          SliverToBoxAdapter(child: AppSpacing.v16),
          // view all button
          BlocProvider(
            create: (context) => getIt<ProductsCubit>()..getAllProducts(),
            child: ViewAllProductsButton(),
          ),
          //spacing for lower part
          SliverToBoxAdapter(child: AppSpacing.v40),
        ],
      ),
    );
  }
}
