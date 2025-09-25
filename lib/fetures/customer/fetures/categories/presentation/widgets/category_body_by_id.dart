import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/screens/empty_screen.dart';
import 'package:shopi/core/shimmer/loading_shimmer.dart';
import 'package:shopi/fetures/customer/fetures/categories/presentation/cubit/products_by_category_id_cubit.dart';
import 'package:shopi/fetures/customer/fetures/products_view_all/persentation/widgets/customer_product_item.dart';

class CustomerCategoryBodyById extends StatelessWidget {
  const CustomerCategoryBodyById({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: BlocBuilder<ProductsByCategoryIdCubit, ProductsByCategoryIdState>(
        builder: (context, state) {
          final productList = context
              .read<ProductsByCategoryIdCubit>()
              .productsList;
          return state is LoadingGetProductsByCategoryIdState
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
              : state is ErrorGetProductsByCategoryIdState &&
                    productList.isEmpty
              ? Center(child: Text(state.errorMessage))
              : productList.isEmpty
              ? const EmptyScreen()
              : GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //Number of cloums
                    crossAxisSpacing: 8, // Spacing between colums
                    mainAxisSpacing: 15, //Spacing between rows
                    childAspectRatio: 165 / 250,
                  ),
                  itemBuilder: (context, index) {
                    return CustomerProductItem(
                      price: productList[index].price ?? 0,
                      categoryName: productList[index].category!.name ?? '',
                      title: productList[index].title ?? '',
                      imageUrl: productList[index].images!.first,
                      productId: int.parse(productList[index].id ?? '0'),
                    );
                  },
                );
        },
      ),
    );
  }
}
