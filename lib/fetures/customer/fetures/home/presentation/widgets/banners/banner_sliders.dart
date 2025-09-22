import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/extensions/string_extentions.dart';
import 'package:shopi/core/widgets/custom_container_linear_customer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopi/core/widgets/text_app.dart';

class BannerSliders extends StatefulWidget {
  const BannerSliders({required this.bannersList, super.key});

  final List<String> bannersList;

  @override
  State<BannerSliders> createState() => _BannerSlidersState();
}

class _BannerSlidersState extends State<BannerSliders> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          TextApp(
            text: 'Promotions',
            style: AppTextStyles.text20w700.copyWith(
              color: context.color.textColor,
            ),
          ),
          AppSpacing.v8,
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 160.h,
              reverse: true,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) {
                activeIndex = index;
                setState(() {});
              },
            ),
            itemCount: widget.bannersList.length,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomContainerLinearCustomer(
                  height: 160.h,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: widget.bannersList[index].imageProductFormate(),
                      fit: BoxFit.fill,
                      placeholder: (context, url) => const SizedBox.shrink(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, color: Colors.red, size: 30),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.bannersList.asMap().entries.map((entry) {
              return Container(
                width: 15.w,
                height: 4.h,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: activeIndex == entry.key
                      ? context.color.bluePinkLight
                      : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
