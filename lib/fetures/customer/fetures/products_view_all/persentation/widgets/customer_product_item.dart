import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/extensions/string_extentions.dart';
import 'package:shopi/core/routes/routes.dart';
import 'package:shopi/core/widgets/custom_container_linear_customer.dart';
import 'package:shopi/core/widgets/custom_favorite_button.dart';
// import 'package:shopi/core/widgets/custom_favorite_button.dart';
// import 'package:shopi/core/widgets/custom_share_button.dart';
import 'package:shopi/core/widgets/text_app.dart';

class CustomerProductItem extends StatelessWidget {
  const CustomerProductItem({
    required this.imageUrl,
    required this.title,
    required this.categoryName,
    required this.price,
    required this.productId,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String categoryName;
  final double price;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushName(Routes.customerProductDetails, arguments: productId);
      },
      child: CustomContainerLinearCustomer(
        height: 250.h,
        width: 165.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //  //   Share Button
                //     BlocBuilder<ShareCubit, ShareState>(
                //       builder: (context, state) {
                //         return state.when(
                //           initial: () {
                //             return CustomShareButton(
                //               size: 25,
                //               onTap: () {
                //                 // context.read<ShareCubit>().sendDynamicLinkProduct(
                //                 //   imageUrl: imageUrl,
                //                 //   productId: productId,
                //                 //   title: title,
                //                 // );
                //               },
                //             );
                //           },
                //           loading: (id) {
                //             if (id == productId) {
                //               return Padding(
                //                 padding: EdgeInsets.only(left: 10.w),
                //                 child: SizedBox(
                //                   height: 25.h,
                //                   width: 25.w,
                //                   child: CircularProgressIndicator(
                //                     color: context.color.bluePinkLight,
                //                   ),
                //                 ),
                //               );
                //             }
                //             return CustomShareButton(size: 25, onTap: () {});
                //           },
                //           success: () {
                //             return CustomShareButton(
                //               size: 25,
                //               onTap: () {
                //                 // context.read<ShareCubit>().sendDynamicLinkProduct(
                //                 //   imageUrl: imageUrl,
                //                 //   productId: productId,
                //                 //   title: title,
                //                 // );
                //               },
                //             );
                //           },
                //         );
                //       },
                //     ),
                //   Favorite Button
                // BlocBuilder<FavoritesCubit, FavoritesState>(
                //   builder: (context, state) {
                //     return
                CustomFavoriteButton(
                  size: 25,
                  isFavorites: true,
                  // context.read<FavoritesCubit>().isFavorites(
                  //   productId.toString(),
                  // ),
                  onTap: () async {
                    // await context.read<FavoritesCubit>().manageFavourites(
                    //   productId: productId.toString(),
                    //   title: title,
                    //   image: imageUrl,
                    //   price: price.toString(),
                    //   categoryName: categoryName,
                    // );
                  },
                  //   );
                  // },
                ),
              ],
            ),

            // Image
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
            // AppSpacing.h8,

            // title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
              child: TextApp(
                text: title,
                style: AppTextStyles.text12w700.copyWith(
                  color: context.color.textColor!.withOpacity(.7),
                ),
                maxLines: 1,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                SizedBox(height: 5.h),

                // Price
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: TextApp(
                    text: '\$ $price',
                    style: AppTextStyles.text12w400.copyWith(
                      color: context.color.textColor!.withOpacity(.7),
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            AppSpacing.v8,
          ],
        ),
      ),
    );
  }
}
