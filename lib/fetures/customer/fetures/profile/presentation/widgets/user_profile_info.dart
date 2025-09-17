import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/extensions/string_extentions.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/utils/image_pick.dart';
import 'package:shopi/core/widgets/text_app.dart';

class UserProfileInfo extends StatefulWidget {
  const UserProfileInfo({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  final String userName;
  final String userEmail;

  @override
  State<UserProfileInfo> createState() => _UserProfileInfoState();
}

class _UserProfileInfoState extends State<UserProfileInfo> {
  String? userImagePath;

  @override
  void initState() {
    super.initState();
    _loadUserImage();
  }

  Future<void> _loadUserImage() async {
    final storedPath = SharedPref().getString(SharedPrefKeys.userImage);
    setState(() {
      userImagePath = storedPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 60.r,
              backgroundImage:
                  userImagePath != null && userImagePath!.isNotEmpty
                  ? FileImage(File(userImagePath!))
                  : const AssetImage("assets/images/default_user.png")
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
                  backgroundColor: context.color.textColor!.withOpacity(0.8),
                  child: Icon(Icons.edit, color: Colors.white, size: 20.sp),
                ),
              ),
            ),
          ],
        ),
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
        AppSpacing.v8,
        Divider(
          color: context.color.textColor,
          thickness: .5.w,
          endIndent: 40.w,
          indent: 40.w,
        ),
      ],
    );
  }
}
