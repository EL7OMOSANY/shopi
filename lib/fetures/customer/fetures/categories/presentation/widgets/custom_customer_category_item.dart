import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/widgets/custom_admin_container.dart';
import 'package:shopi/core/widgets/text_app.dart';

class CustomCustomerCategoryItem extends StatelessWidget {
  const CustomCustomerCategoryItem({
    super.key,
    required this.name,
    required this.image,
  });
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 180.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: CachedNetworkImage(
                height: 150.h,
                width: 100.w,
                imageUrl: image,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red, size: 70),
              ),
            ),
            AppSpacing.v12,
            TextApp(
              text: name,
              style: AppTextStyles.text16w700.copyWith(color: Colors.white),
            ),
            //image
          ],
        ),
      ),
    );
  }
}
