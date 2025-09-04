import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/extensions/string_extentions.dart';
import 'package:shopi/core/widgets/custom_admin_container.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/widgets/delete/delete_product_widget.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/widgets/updae/update_product_widget.dart';

class ProductAdminItem extends StatelessWidget {
  const ProductAdminItem({
    required this.imageUrl,
    required this.title,
    required this.categoryName,
    required this.price,
    required this.productId,
    required this.imageList,
    required this.description,
    required this.categoryId,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String categoryName;
  final String description;
  final String price;
  final String productId;
  final String categoryId;
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 250.h,
      width: 165.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),

          // Show Image
          Flexible(
            child: Center(
              child: CachedNetworkImage(
                height: 180.h,
                width: 140.w,
                imageUrl: imageUrl.imageProductFormate(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Color.fromARGB(255, 188, 51, 42),
                  size: 70,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          // title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextApp(
              text: title,
              style: AppTextStyles.text12w700.copyWith(
                color: context.color.textColor!.withOpacity(.7),
              ),
              maxLines: 1,
            ),
          ),
          SizedBox(height: 5.h),
          // Category Name
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextApp(
              text: categoryName,
              style: AppTextStyles.text12w700.copyWith(
                color: context.color.textColor!.withOpacity(.7),
              ),
              maxLines: 1,
            ),
          ),

          // Price +  Delete + Update
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextApp(
                  text: '\$ $price',

                  style: AppTextStyles.text12w400.copyWith(
                    color: context.color.textColor!.withOpacity(.7),
                  ),
                  maxLines: 1,
                ),
                //Delete Button
                DeleteProductWidget(productId: productId),
                //Update Button
                UpdateProductWidget(
                  imageList: imageList,
                  categoryName: categoryName,
                  description: description,
                  price: price,
                  productId: productId,
                  title: title,
                  categoryId: categoryId,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
