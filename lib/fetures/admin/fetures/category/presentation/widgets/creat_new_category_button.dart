import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/app/upload_image_cubit/upload_image_cubit.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/core/utils/toast_utils.dart';
import 'package:shopi/core/widgets/custom_button.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';

class CreatNewCategoryButton extends StatelessWidget {
  const CreatNewCategoryButton({
    super.key,
    required this.nameCategoryController,
    required this.formKey,
  });
  final TextEditingController nameCategoryController;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
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
          ToastUtils.showError(context, title: 'Error', message: state.error);
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
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.color.textFormBorder!.withOpacity(.5),
                  ),
                ),
              )
            : CustomButton(
                onPressed: () {
                  _validCreateCategory(context);
                },
                backgroundColor: context.color.textFormBorder!.withOpacity(.5),
                lastRadius: 20,
                threeRadius: 20,
                textColor: ColorsDark.white,
                text: 'Create a new category',
                width: MediaQuery.of(context).size.width,
                height: 50.h,
              );
      },
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
