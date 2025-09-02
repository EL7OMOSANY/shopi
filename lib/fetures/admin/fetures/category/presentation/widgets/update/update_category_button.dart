import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/app/upload_image_cubit/upload_image_cubit.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/core/widgets/custom_button.dart';
import 'package:shopi/core/widgets/custom_text_field.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/update_category_request.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/update/update_upload_image.dart';

class UpdateCategoryBottomWidget extends StatefulWidget {
  const UpdateCategoryBottomWidget({
    required this.imageUrl,
    required this.categoryId,
    required this.ctageoryName,
    super.key,
  });

  final String imageUrl;
  final String categoryId;
  final String ctageoryName;

  @override
  State<UpdateCategoryBottomWidget> createState() =>
      _UpdateCategoryBottomWidgetState();
}

class _UpdateCategoryBottomWidgetState
    extends State<UpdateCategoryBottomWidget> {
  TextEditingController nameCategoryController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    nameCategoryController.text = widget.ctageoryName;
  }

  @override
  void dispose() {
    nameCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: TextApp(
              text: 'Update Category',
              style: AppTextStyles.text20w700.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(height: 20.h),
          TextApp(
            text: 'Update a photo',
            style: AppTextStyles.text16w700.copyWith(color: Colors.white),
          ),
          SizedBox(height: 10.h),
          // update upload inage
          UpdateUploadImage(imageUrl: widget.imageUrl),
          SizedBox(height: 20.h),
          TextApp(
            text: 'Upadate the Category Name',
            style: AppTextStyles.text16w700.copyWith(color: Colors.white),
          ),
          SizedBox(height: 10.h),
          // Name for category TextForm
          CustomTextField(
            controller: nameCategoryController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Category Name',
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 2) {
                return 'Please Selected Your Category Name';
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          //Update Category Button
          CustomButton(
            onPressed: () {
              _validUpdateCategory(context);
            },
            backgroundColor: ColorsDark.white,
            lastRadius: 20,
            threeRadius: 20,
            textColor: context.color.mainColor,
            text: 'Update a new category',
            width: MediaQuery.of(context).size.width,
            height: 50.h,
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  void _validUpdateCategory(BuildContext context) {
    final cubit = context.read<CategoriesCubit>();
    if (formKey.currentState!.validate()) {
      cubit.updateCategory(
        UpdateCategoryRequest(
          id: widget.categoryId,
          name: nameCategoryController.text.trim(),
          image: context.read<UploadImageCubit>().getImageUrl.isEmpty
              ? widget.imageUrl
              : context.read<UploadImageCubit>().getImageUrl,
        ),
      );
      context.pop();
      cubit.getAllCategories();
    }
  }
}
