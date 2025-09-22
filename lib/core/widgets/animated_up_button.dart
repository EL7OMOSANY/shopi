import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/extensions/context_ext.dart';

class AnimatedUpButton extends StatelessWidget {
  const AnimatedUpButton({super.key, required this.scrollCntroller});
  final ScrollController scrollCntroller;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 200,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: FloatingActionButton(
            heroTag: 'up',
            onPressed: scrollUp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60.r),
            ),
            // ignore: deprecated_member_use
            backgroundColor: context.color.textFormBorder!.withOpacity(0.8),
            child: const Icon(
              Icons.arrow_upward_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }

  void scrollUp() {
    scrollCntroller.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void dispose() {
    scrollCntroller.dispose();
  }
}
