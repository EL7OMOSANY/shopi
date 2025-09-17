import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/utils/image_pick.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  String? imagePath;

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  Future<void> _loadSavedImage() async {
    final path = await ImagePick().loadProfileImage();
    setState(() {
      imagePath = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 500,
      child: InkWell(
        onTap: () async {
          final source = await ImagePick().showImageSourceDialog(context);

          if (source != null) {
            final pickedFile = await ImagePick().setImage(source);
            if (pickedFile != null) {
              await ImagePick().saveImage(pickedFile.path);
              setState(() {
                imagePath = pickedFile.path;
              });
              log(
                "Image path in shared pref: ${SharedPref().getString(SharedPrefKeys.userImage)}",
              );
            }
          }
        },
        child: CircleAvatar(
          radius: 50.r,
          backgroundImage: imagePath == null || imagePath!.isEmpty
              ? const AssetImage("assets/images/core/def_user.png")
              : FileImage(File(imagePath!)) as ImageProvider,
        ),
      ),
    );
  }
}
