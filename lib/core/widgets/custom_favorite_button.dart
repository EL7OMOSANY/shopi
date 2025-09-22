import 'package:flutter/material.dart';
import 'package:shopi/core/extensions/context_ext.dart';

class CustomFavoriteButton extends StatelessWidget {
  const CustomFavoriteButton({
    required this.size,
    required this.isFavorites,
    required this.onTap,
    super.key,
  });

  final double size;
  final bool isFavorites;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      icon: Icon(
        isFavorites ? Icons.favorite : Icons.favorite_outline,
        color: isFavorites ? Colors.red : context.color.mainColor,
        size: size,
      ),
    );
  }
}
