import 'dart:ui';

import 'package:flutter/material.dart';

class NeonLightPainter extends StatelessWidget {
  const NeonLightPainter({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: 200,
        sigmaY: 200,
        tileMode: TileMode.decal,
      ),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
