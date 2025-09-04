import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/core/utils/toast_utils.dart';
import 'package:shopi/core/widgets/custom_button.dart';
import 'package:shopi/core/widgets/custom_create_drop_down.dart';
import 'package:shopi/core/widgets/custom_text_field.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/update_product_request.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/widgets/updae/update_product_images.dart';

class UpdateProductBottomSheet extends StatefulWidget {
  const UpdateProductBottomSheet({
    required this.imageList,
    required this.categoryName,
    required this.title,
    required this.price,
    required this.description,
    required this.productId,
    required this.categoryId,
    super.key,
  });

  final List<String> imageList;
  final String categoryName;
  final String title;
  final String price;
  final String description;
  final String productId;
  final String categoryId;

  @override
  State<UpdateProductBottomSheet> createState() =>
      _UpdateProductBottomSheetState();
}

class _UpdateProductBottomSheetState extends State<UpdateProductBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  String? categoryValueName;
  String? categoryValueId;

  @override
  void initState() {
    super.initState();

    categoryValueName = widget.categoryName;
    categoryValueId = widget.categoryId;
    _titleController.text = widget.title;
    _priceController.text = widget.price;
    _descriptionController.text = widget.description;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
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
                  text: 'Update Product',
                  style: AppTextStyles.text20w700.copyWith(
                    // ignore: deprecated_member_use
                    color: context.color.textFormBorder!.withOpacity(.8),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextApp(
                text: 'Update a photos',
                style: AppTextStyles.text16w700.copyWith(
                  // ignore: deprecated_member_use
                  color: context.color.textFormBorder!.withOpacity(.8),
                ),
              ),
              SizedBox(height: 15.h),
              //Update Image Widget
              UpdateProductImages(imageList: widget.imageList),
              SizedBox(height: 15.h),
              TextApp(
                text: 'Title',
                style: AppTextStyles.text16w700.copyWith(
                  // ignore: deprecated_member_use
                  color: context.color.textFormBorder!.withOpacity(.8),
                ),
              ),
              SizedBox(height: 15.h),
              // Title
              CustomTextField(
                controller: _titleController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Title',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'Please Selected Your Product Title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              TextApp(
                text: 'Price',
                style: AppTextStyles.text16w700.copyWith(
                  // ignore: deprecated_member_use
                  color: context.color.textFormBorder!.withOpacity(.8),
                ),
              ),
              SizedBox(height: 15.h),
              // Price
              CustomTextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                hintText: 'Price',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Selected Your Product Price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              TextApp(
                text: 'Description',
                style: AppTextStyles.text16w700.copyWith(
                  // ignore: deprecated_member_use
                  color: context.color.textFormBorder!.withOpacity(.8),
                ),
              ),
              SizedBox(height: 15.h),
              //Description
              CustomTextField(
                controller: _descriptionController,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                hintText: 'Description',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'Please Selected Your Product description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              TextApp(
                text: 'Category',
                style: AppTextStyles.text16w700.copyWith(
                  // ignore: deprecated_member_use
                  color: context.color.textFormBorder!.withOpacity(.8),
                ),
              ),
              SizedBox(height: 15.h),
              // Category Drop Doown
              BlocProvider(
                create: (context) =>
                    getIt<CategoriesCubit>()..getAllCategories(),
                child: BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    final cubit = context.read<CategoriesCubit>();
                    return state is LoadingUpdateProductState
                        ? CustomCreateDropDown(
                            hintText: '',
                            items: const [''],
                            onChanged: (value) {},
                            value: '',
                          )
                        : CustomCreateDropDown(
                            hintText: '',
                            items: cubit.dropdownList,
                            onChanged: (value) {
                              setState(() {
                                categoryValueName = value;

                                final catgeoryIdString = cubit.categoriesList
                                    .firstWhere((e) => e.name == value)
                                    .id!;
                                categoryValueId = catgeoryIdString;
                              });
                            },
                            value: categoryValueName,
                          );
                  },
                ),
              ),
              SizedBox(height: 15.h),
              //Update Product Button
              BlocConsumer<ProductsCubit, ProductsState>(
                listener: (context, state) {
                  if (state is SuccessUpdateProductState) {
                    context.pop();
                    ToastUtils.showSuccess(
                      context,
                      title: 'Success',
                      message: '${_titleController.text} Update Success',
                    );
                  } else if (state is ErrorUpdateProductState) {
                    ToastUtils.showError(
                      context,
                      title: 'Error',
                      message: state.error,
                    );
                  }
                },
                builder: (context, state) {
                  return state is LoadingUpdateProductState
                      ? Container(
                          height: 50.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color: context.color.textFormBorder!.withOpacity(
                              .8,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: ColorsDark.white,
                            ),
                          ),
                        )
                      : CustomButton(
                          onPressed: () {
                            _validUpdateProduct(context);
                          },
                          backgroundColor: context.color.textFormBorder!
                              // ignore: deprecated_member_use
                              .withOpacity(.5),
                          lastRadius: 20,
                          threeRadius: 20,
                          textColor: ColorsDark.white,
                          text: 'Update Product',
                          width: MediaQuery.of(context).size.width,
                          height: 50.h,
                        );
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  void _validUpdateProduct(BuildContext context) {
    if (fromKey.currentState!.validate()) {
      final updatedCategoryId = categoryValueId ?? widget.categoryId;
      log("walid => ${double.parse(updatedCategoryId)}");

      context.read<ProductsCubit>().updateProduct(
        UpdateProductRequest(
          description: _descriptionController.text.trim(),
          price: double.parse(_priceController.text.trim()),
          categoryId: double.parse(updatedCategoryId),
          imageList: widget.imageList,
          productId: widget.productId,
          title: _titleController.text.trim(),
        ),
      );
    }
  }
}
