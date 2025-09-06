import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopi/core/shimmer/loading_shimmer.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/widgets/product_admin_item.dart';

class CustomAllProductsList extends StatelessWidget {
  const CustomAllProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();

    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          cubit.getAllProducts();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(
              child: BlocConsumer<ProductsCubit, ProductsState>(
                listener: (context, state) {
                  if (state is ErrorGetAllProductState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                builder: (context, state) {
                  final productList = cubit.productsList;
                  return state is LoadingGetAllProductState
                      ? GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, //Number of cloums
                                crossAxisSpacing: 8, // Spacing between colums
                                mainAxisSpacing: 15, //Spacing between rows
                                childAspectRatio: 165 / 250,
                              ),
                          itemBuilder: (context, index) {
                            return LoadingShimmer(height: 220.h, width: 165.w);
                          },
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: productList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, //Number of cloums
                                crossAxisSpacing: 8, // Spacing between colums
                                mainAxisSpacing: 15, //Spacing between rows
                                childAspectRatio: 165 / 250,
                              ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 500),
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: ProductAdminItem(
                                    imageUrl: productList[index].images!.first,
                                    productId: productList[index].id ?? '',
                                    categoryName:
                                        productList[index].category!.name ?? '',
                                    price: productList[index].price.toString(),
                                    title: productList[index].title ?? '',
                                    imageList: productList[index].images ?? [],
                                    description:
                                        productList[index].description ?? '',
                                    categoryId:
                                        productList[index].category!.id ?? '',
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          ],
        ),
      ),
    );
  }
}
