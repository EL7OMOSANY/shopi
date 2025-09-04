import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/widgets/create/create_product.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/widgets/custom_all_products_list.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          //Add products button
          CreateProduct(),
          AppSpacing.v24,
          //Get ALl Product
          CustomAllProductsList(),
        ],
      ),
    );
  }
}
