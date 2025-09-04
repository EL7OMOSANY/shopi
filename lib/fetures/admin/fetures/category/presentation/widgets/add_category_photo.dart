import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/app/upload_image_cubit/upload_image_cubit.dart';
import 'package:shopi/core/constants/app_text_styles.dart' show AppTextStyles;
import 'package:shopi/core/widgets/custom_button.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';

class AddCategoryPhoto extends StatelessWidget {
  const AddCategoryPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Add a photo',
          style: AppTextStyles.text16w700.copyWith(color: Colors.white),
        ),
        //Remove Image
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (context.read<UploadImageCubit>().getImageUrl.isEmpty) {
              return const SizedBox.shrink();
            }
            return CustomButton(
              onPressed: () {
                context.read<UploadImageCubit>().removeImage();
              },
              backgroundColor: Colors.red,
              lastRadius: 10,
              threeRadius: 10,
              text: 'Remove',
              width: 120.w,
              height: 35.h,
            );
          },
        ),
      ],
    );
  }
}
