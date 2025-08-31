import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/shimmer/loading_shimmer.dart';
import 'package:shopi/core/widgets/custom_admin_container.dart';
import 'package:shopi/core/widgets/text_app.dart';

class DashBoardContiner extends StatelessWidget {
  const DashBoardContiner({
    required this.title,
    required this.number,
    required this.image,
    required this.isLoading,
    super.key,
  });

  final String title;
  final String number;
  final String image;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
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
                  text: title,
                  style: AppTextStyles.text16w700.copyWith(color: Colors.white),
                ),
                const Spacer(),
                if (isLoading)
                  LoadingShimmer(height: 30.h, width: 100.w)
                else
                  TextApp(
                    text: number,
                    style: AppTextStyles.text24w700.copyWith(
                      color: Colors.white,
                    ),
                  ),
                const Spacer(),
              ],
            ),
            SizedBox(height: 90.h, child: Image.asset(image)),
          ],
        ),
      ),
    );
  }
}
