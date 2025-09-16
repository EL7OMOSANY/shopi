import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopi/core/extensions/context_ext.dart';

class IconTapNavBar extends StatelessWidget {
  const IconTapNavBar({
    required this.onTap,
    required this.icon,
    required this.isSelected,
    super.key,
  });
  final VoidCallback onTap;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
          SvgPicture.asset(
                icon,
                color: isSelected
                    ? context.color.navBarSelectedTab
                    : Colors.grey,
                height: 25.h,
              )
              .animate(target: isSelected ? 1 : 0)
              .scaleXY(end: 1.5, alignment: Alignment.bottomRight),
    );
  }
}
