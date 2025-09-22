import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopi/core/widgets/custom_share_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/customer/fetures/product_details/data/models/product_details_reponse.dart';
import 'package:shopi/fetures/customer/fetures/product_details/presentation/widgets/product_details_image_slider.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({required this.productModel, super.key});

  final ProductDetailsModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // share and favorite button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Share Button
                // BlocBuilder<ShareCubit, ShareState>(
                //   builder: (context, state) {
                //     return state.when(
                //       initial: () {
                //         return CustomShareButton(
                //           size: 30,
                //           onTap: () {
                //             context.read<ShareCubit>().sendDynamicLinkProduct(
                //               imageUrl: productModel.images.first,
                //               productId: int.parse(productModel.id.toString()),
                //               title: productModel.title ?? '',
                //             );
                //           },
                //         );
                //       },
                //       loading: (id) {
                //         if (id.toString() == productModel.id) {
                //           return Padding(
                //             padding: EdgeInsets.only(left: 10.w),
                //             child: SizedBox(
                //               height: 25.h,
                //               width: 25.w,
                //               child: CircularProgressIndicator(
                //                 color: context.color.bluePinkLight,
                //               ),
                //             ),
                //           );
                //         }
                //         return CustomShareButton(size: 30, onTap: () {});
                //       },
                //       success: () {
                //         return CustomShareButton(
                //           size: 30,
                //           onTap: () {
                //             context.read<ShareCubit>().sendDynamicLinkProduct(
                //               imageUrl: productModel.images.first,
                //               productId: int.parse(productModel.id.toString()),
                //               title: productModel.title ?? '',
                //             );
                //           },
                //         );
                //       },
                //     );
                //   },
                // ),
                //Favorite Button
                // BlocBuilder<FavoritesCubit, FavoritesState>(
                //   builder: (context, state) {
                //     return CustomFavoriteButton(
                //       size: 30,
                //       isFavorites: context.read<FavoritesCubit>().isFavorites(
                //         productModel.id ?? '',
                //       ),
                //       onTap: () async {
                //         await context.read<FavoritesCubit>().manageFavourites(
                //           productId: productModel.id ?? '',
                //           title: productModel.title ?? '',
                //           image: productModel.images.first,
                //           price: productModel.price.toString(),
                //           categoryName: productModel.category!.name,
                //         );
                //       },
                //     );
                //   },
                // ),
              ],
            ),
            SizedBox(height: 10.h),
            //Image
            ProductDetailsImageSlider(imageList: productModel.images),

            SizedBox(height: 30.h),
            //Title
            TextApp(
              text: productModel.title ?? '',
              style: AppTextStyles.text16w400.copyWith(
                color: context.color.textColor,
              ),
            ),
            SizedBox(height: 15.h),
            //description
            TextApp(
              text: productModel.description ?? '',
              style: AppTextStyles.text16w400.copyWith(
                color: context.color.textColor,
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
