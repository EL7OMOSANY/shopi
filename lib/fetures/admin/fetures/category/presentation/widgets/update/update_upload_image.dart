import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/app/upload_image_cubit/upload_image_cubit.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/utils/toast_utils.dart';

class UpdateUploadImage extends StatelessWidget {
  const UpdateUploadImage({required this.imageUrl, super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        if (state is UploadImageSuccess) {
          ToastUtils.showSuccess(
            context,

            message: context.tr(LangKeys.imageUploaded),
            title: 'Success',
          );
        } else if (state is UploadImageError) {
          ToastUtils.showError(context, message: state.error, title: 'Error');
        }
      },
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();
        return state is UploadImageLoading
            ? Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            : InkWell(
                onTap: cubit.uploadImage,
                child: Stack(
                  children: [
                    // old image url and new
                    Container(
                      height: 120.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            cubit.getImageUrl.isEmpty
                                ? imageUrl
                                : cubit.getImageUrl,
                          ),
                        ),
                      ),
                    ),

                    //Image selected
                    if (cubit.getImageUrl.isEmpty)
                      Container(
                        height: 120.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              );
      },
    );
  }
}
