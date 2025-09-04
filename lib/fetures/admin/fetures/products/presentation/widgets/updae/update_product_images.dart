import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/app/upload_image_cubit/upload_image_cubit.dart';
import 'package:shopi/core/extensions/string_extentions.dart';
import 'package:shopi/core/utils/toast_utils.dart';

class UpdateProductImages extends StatelessWidget {
  const UpdateProductImages({required this.imageList, super.key});

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return BlocConsumer<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            if (state is UploadImageSuccess) {
              ToastUtils.showSuccess(
                context,
                title: 'Success',
                message: 'Update Success',
              );
            } else if (state is UploadImageError) {
              ToastUtils.showError(
                context,
                title: 'Error',
                message: state.error,
              );
            }
          },

          builder: (context, state) {
            return state is UploadImageLoading
                ? Container(
                    height: 90.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  )
                : UpdateSelectedImageWidget(
                    imageList: imageList,
                    index: index,
                    onTap: () {
                      context.read<UploadImageCubit>().uploadUpdateImageList(
                        indexId: index,
                        productImageList: imageList,
                      );
                    },
                  );
          },
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 6.h),
    );
  }
}

class UpdateSelectedImageWidget extends StatelessWidget {
  const UpdateSelectedImageWidget({
    required this.imageList,
    required this.index,
    required this.onTap,
    super.key,
  });

  final List<String> imageList;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Image
          Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imageList[index].imageProductFormate()),
              ),
            ),
          ),
          //Icon Button
          Container(
            height: 90.h,
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
  }
}
