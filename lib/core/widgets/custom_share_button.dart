import 'package:flutter/material.dart';
import 'package:shopi/core/extensions/context_ext.dart';

class CustomShareButton extends StatelessWidget {
  const CustomShareButton({required this.size, required this.onTap, super.key});

  final double size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      icon: Icon(Icons.share, color: context.color.textColor, size: size),
    );
  }
}
