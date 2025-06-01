import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TvOverviewScreen extends StatelessWidget {
  const TvOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(height: 100.0, width: 100.0, color: Colors.red),
        ),
      ],
    );
  }
}
