import 'package:flutter/material.dart';
import 'package:shopi/core/widgets/custom_text_field.dart';

class AddCategoryNameTextField extends StatelessWidget {
  const AddCategoryNameTextField({
    super.key,
    required this.nameCategoryController,
  });
  final TextEditingController nameCategoryController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: nameCategoryController,
      keyboardType: TextInputType.emailAddress,
      hintText: 'Category Name',
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 2) {
          return 'Please Selected Your Category Name';
        }
        return null;
      },
    );
  }
}
