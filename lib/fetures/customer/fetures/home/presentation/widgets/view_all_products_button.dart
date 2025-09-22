import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/routes/routes.dart';
import 'package:shopi/core/widgets/custom_button.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';

class ViewAllProductsButton extends StatelessWidget {
  const ViewAllProductsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final productsCubit = context.read<ProductsCubit>();
    return SliverToBoxAdapter(
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (productsCubit.productsList.length >= 10) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CustomButton(
                height: 50.h,
                lastRadius: 10,
                threeRadius: 10,
                width: MediaQuery.of(context).size.width,
                backgroundColor: context.color.bluePinkLight,
                textColor: Colors.black,
                text: context.tr(LangKeys.viewAll),
                onPressed: () {
                  context.pushName(Routes.productsViewAll);
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
