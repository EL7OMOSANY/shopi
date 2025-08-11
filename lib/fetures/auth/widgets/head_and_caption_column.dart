import 'package:flutter/material.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/widgets/text_app.dart';

class HeadAndCaptionColumn extends StatelessWidget {
  const HeadAndCaptionColumn({super.key, required this.head, required this.caption});
  final String head;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextApp(text: head, style: AppTextStyles.text18w700),
        AppSpacing.v16,
        TextApp(
          textAlign: TextAlign.center,
          text: caption,
          style: AppTextStyles.text14w400,
        ),
      ],
    );
  }
}
