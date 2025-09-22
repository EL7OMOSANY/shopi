import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/animated_up_button.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';
import 'package:shopi/fetures/customer/fetures/products_view_all/persentation/widgets/customer_product_item.dart';

class ProductsViewAllBody extends StatefulWidget {
  const ProductsViewAllBody({super.key});

  @override
  State<ProductsViewAllBody> createState() => _ProductsViewAllBodyState();
}

class _ProductsViewAllBodyState extends State<ProductsViewAllBody> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is LoadingGetAllProductState &&
              cubit.productsList.isEmpty) {
            return Center(
              child: Column(
                children: [
                  Text("Loading...", style: AppTextStyles.text16w500),
                  SizedBox(height: 20.h),
                  CircularProgressIndicator(color: context.color.textColor),
                ],
              ),
            );
          } else if (state is ErrorGetAllProductState &&
              cubit.productsList.isEmpty) {
            return Center(child: Text(state.error));
          } else {
            return Stack(
              children: [
                Column(
                  children: [
                    //view all button
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         CupertinoPageRoute(
                    //           builder: (context) =>
                    //               const SeeAllCustomerProducts(),
                    //         ),
                    //       );
                    //     },
                    //     child: Text(
                    //       context.tr('See All Products'),
                    //       style: AppTextStyles.text16w500,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10.h),
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        controller: scrollController,
                        itemCount: cubit.productsList.length <= 10
                            ? 10
                            : cubit.productsList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, //Number of cloums
                              crossAxisSpacing: 8, // Spacing between colums
                              mainAxisSpacing: 15, //Spacing between rows
                              childAspectRatio: 165 / 250,
                            ),
                        itemBuilder: (context, index) {
                          return CustomerProductItem(
                            price: cubit.productsList[index].price ?? 0,
                            categoryName:
                                cubit.productsList[index].category!.name ?? '',
                            title: cubit.productsList[index].title ?? '',
                            imageUrl: cubit.productsList[index].images!.first,
                            productId: int.parse(
                              cubit.productsList[index].id ?? '0',
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 10.h,
                  right: 10.w,

                  child: AnimatedUpButton(scrollCntroller: scrollController),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
