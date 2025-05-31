import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.white.withValues(alpha: 0.5),
      thickness: 1.3,
      indent: 20.0,
      endIndent: 20.0,
      height: 40.0,
    );
  }
}
