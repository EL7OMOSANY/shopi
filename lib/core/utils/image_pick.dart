import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';

class ImagePick {
  XFile? image;

  //Set image
  Future<XFile?> setImage(ImageSource source) async {
    image = await ImagePicker().pickImage(source: source);
    return image;
  }

  //Save image
  Future<void> saveImage([String? imagePath]) async {
    final pathToSave = imagePath ?? image?.path;
    if (pathToSave != null) {
      await SharedPref().setString(SharedPrefKeys.imagePath, pathToSave);
    }
  }

  //Load image
  Future<String> loadImage() async {
    final storedPath = SharedPref().getString(SharedPrefKeys.imagePath);
    return storedPath ?? '';
  }

  //Clear image
  Future<void> clearImage() async {
    await SharedPref().removePreference(SharedPrefKeys.imagePath);
  }

  //Show image source dialog
  Future<ImageSource?> showImageSourceDialog(BuildContext context) async {
    return await showModalBottomSheet<ImageSource>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      backgroundColor: context.color.mainColor,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                      color: context.color.bluePinkLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                AppSpacing.v24,
                Text(
                  "Select Image Source",
                  style: AppTextStyles.text18w500.copyWith(
                    color: context.color.bluePinkLight,
                  ),
                ),
                AppSpacing.v12,
                ListTile(
                  leading: CircleAvatar(
                    // ignore: deprecated_member_use
                    backgroundColor: context.color.bluePinkLight?.withOpacity(
                      0.4,
                    ),
                    child: Icon(
                      Icons.photo_camera,
                      color: context.color.bluePinkLight,
                    ),
                  ),
                  title: Text(
                    "Camera",
                    style: AppTextStyles.text14w400.copyWith(
                      color: context.color.bluePinkLight,
                    ),
                  ),
                  onTap: () => Navigator.pop(context, ImageSource.camera),
                ),

                ListTile(
                  leading: CircleAvatar(
                    // ignore: deprecated_member_use
                    backgroundColor: context.color.bluePinkLight?.withOpacity(
                      0.4,
                    ),
                    child: Icon(
                      Icons.photo_library,
                      color: context.color.bluePinkLight,
                    ),
                  ),
                  title: Text(
                    "Gallery",
                    style: AppTextStyles.text14w400.copyWith(
                      color: context.color.bluePinkLight,
                    ),
                  ),
                  onTap: () => Navigator.pop(context, ImageSource.gallery),
                ),

                AppSpacing.v16,
              ],
            ),
          ),
        );
      },
    );
  }
}
