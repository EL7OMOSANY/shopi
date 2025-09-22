import 'package:flutter/material.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/fetures/customer/fetures/product_details/presentation/widgets/product_deatils_custom_painter.dart';

class CustomBackGroundPaint extends StatelessWidget {
  const CustomBackGroundPaint({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      painter: DetailsCustomPainter(
        gradient: LinearGradient(
          colors: [
            context.color.containerShadow2!.withOpacity(0.8),
            context.color.textFormBorder!.withOpacity(0.5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
