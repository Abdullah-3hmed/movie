import 'package:flutter/material.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/widgets/neon_light_painter.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            top: 30,
            left: 20,
            child: NeonLightPainter(color: ColorsManager.primaryColor),
          ),
          const Positioned(
            bottom: 350,
            right: 0,
            child: NeonLightPainter(color: ColorsManager.secondaryColor),
          ),
          const Positioned(
            bottom: 20,
            left: 20,
            child: NeonLightPainter(color: ColorsManager.primaryColor),
          ),
          child,
        ],
      ),
    );
  }
}
