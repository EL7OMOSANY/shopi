import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/fetures/customer/fetures/products_view_all/persentation/widgets/customer_product_item.dart';
import 'package:shopi/fetures/customer/fetures/search/presentation/cubit/customer_search_cubit.dart';
import 'package:shopi/fetures/customer/fetures/search/presentation/widgets/filter_buttons.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = context.watch<CustomerSearchCubit>().productList;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        children: [
          const FilterButtons(),

          BlocBuilder<CustomerSearchCubit, CustomerSearchState>(
            builder: (context, state) {
              return state is CustomerSearchLoading
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: context.color.textColor,
                        ),
                      ),
                    )
                  : state is CustomerSearchSuccess
                  ? Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: productList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 15,
                                childAspectRatio: 165 / 250,
                              ),
                          itemBuilder: (context, index) {
                            final item = productList[index];
                            return CustomerProductItem(
                              price: item.price ?? 0,
                              categoryName: item.category?.name ?? '',
                              title: item.title ?? '',
                              imageUrl: item.images?.first ?? '',
                              productId: int.parse(item.id ?? '0'),
                            );
                          },
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
