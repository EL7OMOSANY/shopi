import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/app/upload_image_cubit/upload_image_cubit.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/core/utils/toast_utils.dart';
import 'package:shopi/core/widgets/custom_button.dart';
import 'package:shopi/core/widgets/custom_text_field.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/create/create_upload_image.dart';

class CreateCategoryBottomSheetWidget extends StatefulWidget {
  const CreateCategoryBottomSheetWidget({super.key});

  @override
  State<CreateCategoryBottomSheetWidget> createState() =>
      _CreateCategoryBottomSheetWidgetState();
}

class _CreateCategoryBottomSheetWidgetState
    extends State<CreateCategoryBottomSheetWidget> {
  TextEditingController nameCategoryController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Create Category Title
            Center(
              child: TextApp(
                text: 'Create Category',
                style: AppTextStyles.text16w700.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: 20.h),

            // Add a photo title
            Row(
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
            ),
            SizedBox(height: 10.h),
            //Selected Image  and updload image
            const CategoryUploadImage(),
            SizedBox(height: 20.h),
            //Enter the category name title
            TextApp(
              text: 'Enter the Category Name',
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
            //Create a new category Button
            BlocConsumer<CategoriesCubit, CategoriesState>(
              listener: (context, state) {
                if (state is SuccessCreateCategoryState) {
                  context.pop();
                  ToastUtils.showSuccess(
                    context,
                    message: '${nameCategoryController.text} Created Success',
                    title: 'Success',
                  );
                }
                if (state is ErrorCreateCategoryState) {
                  ToastUtils.showError(
                    context,
                    title: 'Error',
                    message: state.error,
                  );
                }
              },
              builder: (context, state) {
                return state is LoadingCreateCategoryState
                    ? Container(
                        height: 50.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: ColorsDark.blueDark,
                          ),
                        ),
                      )
                    : CustomButton(
                        onPressed: () {
                          _validCreateCategory(context);
                        },
                        backgroundColor: ColorsDark.white,
                        lastRadius: 20,
                        threeRadius: 20,
                        textColor: ColorsDark.blueDark,
                        text: 'Create a new category',
                        width: MediaQuery.of(context).size.width,
                        height: 50.h,
                      );
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  void _validCreateCategory(BuildContext context) {
    if (formKey.currentState!.validate() ||
        context.read<UploadImageCubit>().getImageUrl.isEmpty) {
      if (context.read<UploadImageCubit>().getImageUrl.isEmpty) {
        ToastUtils.showError(
          context,
          title: 'Error',
          message: context.tr(LangKeys.validPickImage),
        );
      } else {
        // send category
        context.read<CategoriesCubit>().createCategory(
          name: nameCategoryController.text.trim(),
          image: context.read<UploadImageCubit>().getImageUrl,
        );
      }
    }
  }
}
