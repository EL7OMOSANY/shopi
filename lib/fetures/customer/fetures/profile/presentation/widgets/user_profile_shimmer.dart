import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/shimmer/loading_shimmer.dart';

class UserProfileShimmer extends StatelessWidget {
  const UserProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                LoadingShimmer(height: 120.h, width: 120.w, borderRadius: 60),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: LoadingShimmer(
                    height: 30.h,
                    width: 30.w,
                    borderRadius: 15,
                  ),
                ),
              ],
            ),
            SizedBox(width: 24.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                LoadingShimmer(height: 30.h, width: 150.w),
                SizedBox(height: 8.h),
                LoadingShimmer(height: 20.h, width: 200.w),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}



/**
 * 
 Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60.r,
                  backgroundImage:
                      userImagePath != null && userImagePath!.isNotEmpty
                      ? FileImage(File(userImagePath!))
                      : const AssetImage("assets/images/core/def_user.png")
                            as ImageProvider,
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: GestureDetector(
                    onTap: () async {
                      final source = await ImagePick().showImageSourceDialog(
                        context,
                      );

                      if (source != null) {
                        final pickedFile = await ImagePick().setImage(source);
                        if (pickedFile != null) {
                          await ImagePick().saveImage(pickedFile.path);
                          setState(() {
                            userImagePath = pickedFile.path;
                          });
                          log(
                            "Image path in shared pref: ${SharedPref().getString(SharedPrefKeys.userImage)}",
                          );
                        }
                      }
                    },
                    child: CircleAvatar(
                      radius: 15.r,
                      // ignore: deprecated_member_use
                      backgroundColor: context.color.textColor!.withOpacity(
                        0.8,
                      ),
                      child: Icon(Icons.edit, color: Colors.white, size: 20.sp),
                    ),
                  ),
                ),
              ],
            ),

            AppSpacing.h24,
            Column(
              children: [
                AppSpacing.v16,
                TextApp(
                  text: widget.userName.toLowerCase().toCapitalized(),
                  style: AppTextStyles.text24w400.copyWith(
                    color: context.color.textColor,
                  ),
                ),
                AppSpacing.v8,
                TextApp(
                  text: widget.userEmail,
                  style: AppTextStyles.text18w400.copyWith(
                    color: context.color.textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        AppSpacing.v16,
        Divider(
          color: context.color.textColor,
          thickness: .5.w,
          endIndent: 40.w,
          indent: 40.w,
        ),
      ],
    )
 */