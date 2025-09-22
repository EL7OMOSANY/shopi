import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/screens/empty_screen.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/widgets/products/products_list.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/widgets/products/products_shimmer.dart';

class CustomerHomeProducts extends StatelessWidget {
  const CustomerHomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final productsCubit = context.read<ProductsCubit>();
    return SliverToBoxAdapter(
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return state is LoadingGetAllProductState
              ? const ProductShimmer()
              : productsCubit.productsList.isEmpty
              ? const EmptyScreen()
              : ProductsList(productList: productsCubit.productsList);
        },
      ),
    );
  }
}
