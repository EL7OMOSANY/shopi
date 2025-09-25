import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/custom_button.dart';

class SaveFilterButton extends StatelessWidget {
  const SaveFilterButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 300,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: CustomButton(
          onPressed: onTap,
          height: 30.h,
          width: 100.w,
          text: 'Save',
          textColor: context.color.textColor,
          // ignore: deprecated_member_use
          backgroundColor: context.color.textFormBorder!.withOpacity(.5),
          threeRadius: 10,
          lastRadius: 10,
        ),
      ),
    );
  }
}
