import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/buutom_sheet/custom_buttom_sheet.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/custom_button.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/create/create_category_button.dart';

class CreateCategoryButton extends StatelessWidget {
  const CreateCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoriesCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Get All Categories',
          style: AppTextStyles.text20w700.copyWith(
            // ignore: deprecated_member_use
            color: Colors.white.withOpacity(.9),
          ),
        ),
        CustomButton(
          onPressed: () {
            CustomButtomSheet.showModalBottomSheetContainer(
              context: context,
              widget: BlocProvider.value(
                value: cubit,
                child: CreateCategoryBottomSheetWidget(),
              ),
              whenComplete: () {
                cubit.getAllCategories();
              },
            );
          },
          // ignore: deprecated_member_use
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
