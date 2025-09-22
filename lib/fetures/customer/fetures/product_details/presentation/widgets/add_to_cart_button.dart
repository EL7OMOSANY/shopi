import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/custom_linear_button.dart';
import 'package:shopi/core/widgets/text_app.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({required this.price, super.key});

  final double price;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 500,
      child: Container(
        height: 90.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: context.color.containerShadow1,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: '\$ $price',
                  style: AppTextStyles.text20w700.copyWith(
                    color: context.color.bluePinkLight,
                  ),
                ),
                CustomLinearButton(
                  onPressed: () {
                    // Add to cart functionality
                  },
                  height: 40.h,
                  width: 140.w,
                  child: TextApp(
                    text: 'Add to cart',
                    style: AppTextStyles.text14w500.copyWith(
                      color: context.color.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
