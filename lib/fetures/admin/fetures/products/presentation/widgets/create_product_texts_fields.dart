import 'package:flutter/material.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/widgets/custom_text_field.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/widgets/custom_category_drop_down.dart';

class CreateProductTextsFields extends StatelessWidget {
  const CreateProductTextsFields({
    super.key,
    required this.titleController,
    required this.priceController,
    required this.descriptionController,
    required this.onChaged,
    required this.categoryName,
  });

  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final void Function(String?) onChaged;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: 'Title',
          style: AppTextStyles.text16w700.copyWith(color: Colors.white),
        ),
        AppSpacing.v16,
        // Title
        CustomTextField(
          textInputAction: TextInputAction.next,
          controller: titleController,
          keyboardType: TextInputType.text,
          hintText: 'Title',
          validator: (value) {
            if (value == null || value.isEmpty || value.length < 2) {
              return 'Please Selected Your Product Title';
            }
            return null;
          },
        ),
        AppSpacing.v16,
        TextApp(
          text: 'Price',
          style: AppTextStyles.text16w700.copyWith(color: Colors.white),
        ),
        AppSpacing.v16,
        // Price
        CustomTextField(
          textInputAction: TextInputAction.next,
          controller: priceController,
          keyboardType: TextInputType.number,
          hintText: 'Price',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Selected Your Product Price';
            }
            return null;
          },
        ),
        AppSpacing.v16,
        TextApp(
          text: 'Description',
          style: AppTextStyles.text16w700.copyWith(color: Colors.white),
        ),
        AppSpacing.v16,
        //Description
        CustomTextField(
          textInputAction: TextInputAction.next,
          controller: descriptionController,
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
        AppSpacing.v16,
        TextApp(
          text: 'Category',
          style: AppTextStyles.text16w700.copyWith(color: Colors.white),
        ),
        AppSpacing.v16,
        // Category Drop Doown
        CustomCategoryDropDown(onChanged: onChaged, categoryName: categoryName),
      ],
    );
  }
}
