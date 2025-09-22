import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/custom_app_bar.dart';
import 'package:shopi/core/widgets/custom_back_ground_paint.dart';
import 'package:shopi/fetures/customer/fetures/product_details/presentation/cubit/customer_product_details_cubit.dart';
import 'package:shopi/fetures/customer/fetures/product_details/presentation/widgets/add_to_cart_button.dart';
import 'package:shopi/fetures/customer/fetures/product_details/presentation/widgets/product_details_body.dart';

class CustomerProductDetailsScreen extends StatelessWidget {
  const CustomerProductDetailsScreen({required this.productId, super.key});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CustomerProductDetailsCubit>()..productDetails(id: productId),

      child:
          BlocBuilder<CustomerProductDetailsCubit, CustomerProductDetailsState>(
            builder: (context, state) {
              final cubit = context.read<CustomerProductDetailsCubit>();

              if (state is CustomerProductDetailsLoading) {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: context.color.textColor,
                    ),
                  ),
                );
              } else if (state is CustomerProductDetailsSuccess) {
                return Scaffold(
                  appBar: CustomAppBar(title: cubit.productDetailsModel.title!),
                  bottomNavigationBar: AddToCartButton(
                    price: cubit.productDetailsModel.price!,
                  ),
                  body: Stack(
                    children: [
                      CustomBackGroundPaint(),
                      ProductDetailsBody(
                        productModel: cubit.productDetailsModel,
                      ),
                    ],
                  ),
                );
              } else {
                return const Scaffold(
                  body: Center(child: Text("Something went wrong or no data")),
                );
              }
            },
          ),
    );
  }
}
