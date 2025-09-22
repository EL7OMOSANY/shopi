import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/extensions/context_ext.dart';

class CustomContainerLinearCustomer extends StatelessWidget {
  const CustomContainerLinearCustomer({
    required this.height,
    required this.width,
    required this.child,
    super.key,
  });

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          // ignore: deprecated_member_use
          color: context.color.textColor!.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          colors: [
            // ignore: deprecated_member_use
            context.color.textFormBorder!.withOpacity(0.5),

            // ignore: deprecated_member_use
            context.color.navBarbg!.withOpacity(0.5),
          ],
          begin: const Alignment(0.36, 0.10),
          end: const Alignment(0.58, 0.85),
        ),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: context.color.containerShadow1!.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
          BoxShadow(
            // ignore: deprecated_member_use
            color: context.color.containerShadow2!.withOpacity(0.9),
            offset: const Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}
