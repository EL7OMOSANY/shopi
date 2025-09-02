import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/app/upload_image_cubit/upload_image_cubit.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/utils/toast_utils.dart';

class CategoryUploadImage extends StatelessWidget {
  const CategoryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        if (state is UploadImageSuccess) {
          ToastUtils.showSuccess(
            context,
            title: 'Success',
            message: context.tr(LangKeys.imageUploaded),
          );
        }
        if (state is UploadImageError) {
          ToastUtils.showError(context, message: state.error, title: 'Error');
        }
        if (state is UploadImageRemoved) {
          ToastUtils.showError(
            context,
            message: LangKeys.imageRemoved,
            title: 'Removed',
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();

        if (state is UploadImageLoading) {
          return Container(
            height: 120.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        } else if (state is UploadImageIsEmpty) {
          return Container(
            height: 120.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(cubit.getImageUrl),
                // fit: BoxFit.fill,
              ),
            ),
          );
        } else {
          return InkWell(
            onTap: () {
              cubit.uploadImage();
            },
            child: Container(
              height: 120.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.add_a_photo_outlined,
                size: 50,
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }
}
