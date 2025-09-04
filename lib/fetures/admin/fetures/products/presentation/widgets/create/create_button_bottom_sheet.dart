import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/app/upload_image_cubit/upload_image_cubit.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/core/utils/toast_utils.dart';
import 'package:shopi/core/widgets/custom_button.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';

class CreateButtonBottomSheet extends StatelessWidget {
  const CreateButtonBottomSheet({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.priceController,
    required this.catgeoryId,
    required this.categoryName,
    required this.formKey,
  });

  final TextEditingController titleController;

  final TextEditingController descriptionController;

  final TextEditingController priceController;
  final double catgeoryId;
  final String categoryName;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is SuccessCreateProductState) {
          context.pop();

          ToastUtils.showSuccess(
            context,
            message: '${titleController.text} Created Success',
            title: 'Success',
          );
        } else if (state is ErrorCreateProductState) {
          ToastUtils.showError(context, message: state.error, title: 'Error');
        }
      },
      builder: (context, state) {
        return state is LoadingCreateProductState
            ? Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: context.color.textFormBorder,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: CircularProgressIndicator(color: ColorsDark.white),
                ),
              )
            : CustomButton(
                onPressed: () {
                  _validCreateProductButton(context);
                },
                backgroundColor: context.color.textFormBorder!.withOpacity(.5),
                lastRadius: 20,
                threeRadius: 20,
                textColor: Colors.white,
                text: 'Create Product',
                width: MediaQuery.of(context).size.width,
                height: 50.h,
              );
      },
    );
  }

  void _validCreateProductButton(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    final indexEmptyImage = context
        .read<UploadImageCubit>()
        .imageList
        .indexWhere((e) => e.isNotEmpty);

    if (formKey.currentState!.validate() &&
        indexEmptyImage != -1 &&
        // ignore: unnecessary_null_comparison
        categoryName != null) {
      if (indexEmptyImage == -1) {
        ToastUtils.showError(
          context,
          title: 'Error',
          message: context.tr(LangKeys.validPickImage),
        );
        // ignore: unnecessary_null_comparison
      } else if (categoryName == null) {
        ToastUtils.showError(
          context,
          title: 'Error',

          message: 'Please select your category',
        );
      } else {
        // create new product
        cubit.createProduct(
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          price: double.parse(priceController.text.trim()),
          imageList: context.read<UploadImageCubit>().imageList,
          categoryId: catgeoryId,
        );
        log(titleController.text.trim());
        log(descriptionController.text.trim());
        log(priceController.text.trim());
        log(context.read<UploadImageCubit>().imageList.toString());
        log(catgeoryId.toString());
        context.read<UploadImageCubit>().imageList = ["", "", ""];
      }
    }
  }
}
