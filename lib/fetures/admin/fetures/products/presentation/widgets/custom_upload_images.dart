import 'package:flutter/material.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/widgets/create/create_product_images.dart';

class CustomUploadImages extends StatelessWidget {
  const CustomUploadImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: 'Select photos',
          style: AppTextStyles.text16w700.copyWith(
            color: context.color.textFormBorder!.withOpacity(.8),
          ),
        ),
        AppSpacing.v16,
        //Create Image Widget
        const CreateProductImages(),
      ],
    );
  }
}
