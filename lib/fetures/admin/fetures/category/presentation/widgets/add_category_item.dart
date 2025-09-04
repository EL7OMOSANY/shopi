import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/widgets/custom_admin_container.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/delete/delete_category.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/edit_category_button.dart';

class AddCatgeoryItem extends StatelessWidget {
  const AddCatgeoryItem({
    required this.name,
    required this.image,
    required this.categoryId,
    super.key,
  });

  final String name;
  final String image;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 180.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                TextApp(
                  text: name,
                  style: AppTextStyles.text20w700.copyWith(color: Colors.white),
                ),
                Spacer(),
                Row(
                  children: [
                    //Delete
                    DeleteCategoryWidget(categoryId: categoryId),
                    SizedBox(width: 20.h),
                    //Update
                    EditCategoryButton(
                      name: name,
                      image: image,
                      categoryId: categoryId,
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            //image
            Flexible(
              child: CachedNetworkImage(
                height: 150.h,
                width: 100.w,
                imageUrl: image,
                // fit: BoxFit.fill,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red, size: 70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
