import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_spacer.dart';

import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/create/create_category.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/custom_categories_list.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
      child: Column(
        children: [
          //Create Category Button
          const CreateCategoryButton(),
          AppSpacing.v24,

          // Category item list
          CustomCategoriesList(),
        ],
      ),
    );
  }
}
