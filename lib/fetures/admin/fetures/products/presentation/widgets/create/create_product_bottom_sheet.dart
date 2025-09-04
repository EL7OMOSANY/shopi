import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/widgets/create/create_button_bottom_sheet.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/widgets/create_product_texts_fields.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/widgets/custom_upload_images.dart';

class CreateProductBottomSheet extends StatefulWidget {
  const CreateProductBottomSheet({super.key});

  @override
  State<CreateProductBottomSheet> createState() =>
      _CreateProductBottomSheetState();
}

class _CreateProductBottomSheetState extends State<CreateProductBottomSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  String? categoryName;
  double? catgeoryId;

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Form(
        key: fromKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title Update Product
              Center(
                child: TextApp(
                  text: 'Create Product',
                  style: AppTextStyles.text20w700.copyWith(
                    color: context.color.textFormBorder!.withOpacity(.8),
                  ),
                ),
              ),
              AppSpacing.v24,
              //Upload Image
              const CustomUploadImages(),
              AppSpacing.v16,

              //complete text fileds
              CreateProductTextsFields(
                titleController: titleController,
                priceController: priceController,
                descriptionController: descriptionController,
                onChaged: (value) {
                  setState(() {
                    categoryName = value;
                    final catgeoryIdString = context
                        .read<CategoriesCubit>()
                        .categoriesList
                        .firstWhere((e) => e.name == value)
                        .id!;
                    catgeoryId = double.parse(catgeoryIdString);
                    log(catgeoryId.toString());
                  });
                },

                categoryName: categoryName ?? '',
              ),
              AppSpacing.v32,

              //Create Product Button
              BlocProvider(
                create: (context) => getIt<CategoriesCubit>(),
                child: CreateButtonBottomSheet(
                  formKey: fromKey,
                  titleController: titleController,
                  descriptionController: descriptionController,
                  priceController: priceController,
                  catgeoryId: catgeoryId ?? 1.0,
                  categoryName: categoryName ?? '',
                ),
              ),
              AppSpacing.v24,
            ],
          ),
        ),
      ),
    );
  }
}
