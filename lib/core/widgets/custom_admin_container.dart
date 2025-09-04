import 'package:flutter/material.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';

class CustomContainerLinearAdmin extends StatelessWidget {
  const CustomContainerLinearAdmin({
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
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            context.color.textFormBorder!.withOpacity(.5),
            context.color.navBarbg!.withOpacity(.5),

            // context.color.textFormBorder!.withOpacity(.5),
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsDark.black1.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
          BoxShadow(
            color: ColorsDark.black2.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shopi/core/style/colors/dark_colors.dart';
// import 'package:shopi/core/constants/app_text_styles.dart';
// import 'package:shopi/core/widgets/text_app.dart';

// class CustomContainerLinearAdmin extends StatelessWidget {
//   const CustomContainerLinearAdmin({
//     required this.image,
//     required this.number,
//     required this.title,
//     this.isLoading = false,
//     super.key,
//   });

//   final String image;
//   final String number;
//   final String title;
//   final bool isLoading;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 120.h,
//       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         gradient: LinearGradient(
//           colors: [
//             ColorsDark.black1.withOpacity(0.8),
//             ColorsDark.black2.withOpacity(0.8),
//           ],
//           begin: const Alignment(0.36, 0.27),
//           end: const Alignment(0.58, 0.85),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: ColorsDark.black1.withOpacity(0.3),
//             offset: const Offset(0, 4),
//             blurRadius: 8,
//           ),
//           BoxShadow(
//             color: ColorsDark.black2.withOpacity(0.3),
//             offset: const Offset(0, 4),
//             blurRadius: 2,
//           ),
//         ],
//       ),
//       child: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   image,
//                   width: 40.w,
//                   height: 40.w,
//                   fit: BoxFit.contain,
//                 ),
//                 SizedBox(width: 15.w),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextApp(
//                       text: title,
//                       style: AppTextStyles.text16w700.copyWith(color: Colors.white),
//                     ),
//                     SizedBox(height: 5.h),
//                     TextApp(
//                       text: number,
//                       style: AppTextStyles.text16w500.copyWith(color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//     );
//   }
// }
