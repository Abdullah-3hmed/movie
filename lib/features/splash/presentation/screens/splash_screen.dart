import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/assets_manager.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), _navigateToNextScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(child: Image.asset(AssetsManager.appLogo));
  }

  void _navigateToNextScreen() {
    if (AppConstants.sessionId.isEmpty) {
      context.replaceRoute(const AuthRoute());
    } else {
      context.replaceRoute(const AuthenticatedRoute());
    }
  }
}
