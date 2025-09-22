import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';
import 'package:shopi/fetures/customer/fetures/products_view_all/persentation/widgets/customer_product_item.dart';

class SeeAllCustomerProducts extends StatelessWidget {
  const SeeAllCustomerProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: cubit.productsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //Number of cloums
        crossAxisSpacing: 8, // Spacing between colums
        mainAxisSpacing: 15, //Spacing between rows
        childAspectRatio: 165 / 250,
      ),
      itemBuilder: (context, index) {
        return CustomerProductItem(
          price: cubit.productsList[index].price ?? 0,
          categoryName: cubit.productsList[index].category!.name ?? '',
          title: cubit.productsList[index].title ?? '',
          imageUrl: cubit.productsList[index].images!.first,
          productId: int.parse(cubit.productsList[index].id ?? '0'),
        );
      },
    );
  }
}
