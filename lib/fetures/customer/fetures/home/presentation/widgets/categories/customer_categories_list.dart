import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/get_all_categories_response.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/widgets/categories/customer_catgeory_item.dart';

class CustomerCategoriesList extends StatelessWidget {
  const CustomerCategoriesList({required this.categoreisList, super.key});

  final List<CategoryContent> categoreisList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
      child: SizedBox(
        height: 125.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categoreisList.length,
          itemBuilder: (context, index) {
            return CustomerCategoryItem(
              image: categoreisList[index].image ?? '',
              title: categoreisList[index].name ?? '',
              id: int.parse(categoreisList[index].id ?? '0'),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 15.w),
        ),
      ),
    );
  }
}
