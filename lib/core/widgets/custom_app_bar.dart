import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopi/core/constants/app_images.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/custom_linear_button.dart';
import 'package:shopi/core/widgets/text_app.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({required this.title, super.key, this.onPressed});

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.color.mainColor,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomLinearButton(
            onPressed:
                onPressed ??
                () {
                  context.pop();
                },
            child: Center(child: SvgPicture.asset(AppImages.backButton)),
          ),
          Flexible(
            child: TextApp(
              text: title,
              style: AppTextStyles.text20w700.copyWith(
                color: context.color.textColor,
              ),
              // textOverflow: TextOverflow.ellipsis,
            ),
          ),
          const Text(''),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
