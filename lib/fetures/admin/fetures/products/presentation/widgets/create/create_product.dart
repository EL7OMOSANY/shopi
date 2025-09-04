import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/buutom_sheet/custom_buttom_sheet.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/custom_button.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/widgets/create/create_product_bottom_sheet.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Get All Products',
          style: AppTextStyles.text18w500.copyWith(color: Colors.white),
        ),
        CustomButton(
          onPressed: () {
            CustomButtomSheet.showModalBottomSheetContainer(
              context: context,
              widget: MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => getIt<ProductsCubit>()),
                  BlocProvider(
                    create: (context) =>
                        getIt<CategoriesCubit>()..getAllCategories(),
                  ),
                ],
                child: CreateProductBottomSheet(),
              ),
              whenComplete: () {
                cubit.getAllProducts();
              },
            );
          },
          backgroundColor: context.color.textFormBorder!.withOpacity(.5),
          lastRadius: 10,
          threeRadius: 10,
          text: 'Add',
          width: 90.w,
          height: 35.h,
        ),
      ],
    );
  }
}
