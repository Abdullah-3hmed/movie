import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/util/assets_manager.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(child: Image.asset(AssetsManager.appLogo));
  }
}
