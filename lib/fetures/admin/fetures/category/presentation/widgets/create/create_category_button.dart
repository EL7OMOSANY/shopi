import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/add_category_name_text_field.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/add_category_photo.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/creat_new_category_button.dart';
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
            AddCategoryPhoto(),
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
            AddCategoryNameTextField(
              nameCategoryController: nameCategoryController,
            ),

            SizedBox(height: 20.h),
            //Create a new category Button
            CreatNewCategoryButton(
              nameCategoryController: nameCategoryController,
              formKey: formKey,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
