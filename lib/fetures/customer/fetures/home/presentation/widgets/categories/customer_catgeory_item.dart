import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/routes/routes.dart';
import 'package:shopi/core/widgets/custom_container_linear_customer.dart';
import 'package:shopi/core/widgets/text_app.dart';

class CustomerCategoryItem extends StatelessWidget {
  const CustomerCategoryItem({
    required this.image,
    required this.title,
    required this.id,
    super.key,
  });

  final String image;
  final String title;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushName(
          Routes.customerCategories,
          arguments: (categoryName: title, categoryId: id),
        );
      },
      child: Column(
        children: [
          //image
          CustomContainerLinearCustomer(
            height: 80.h,
            width: 80.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.contain,
                height: 71.h,
                width: 71.w,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red, size: 30),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 35.h,
            width: 75.w,
            child: TextApp(
              text: title,
              textAlign: TextAlign.center,
              style: AppTextStyles.text12w500.copyWith(
                color: context.color.textColor,
              ),
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
