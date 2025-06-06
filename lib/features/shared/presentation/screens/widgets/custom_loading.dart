import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/core/util/assets_manager.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(AssetsManager.loadingLottie));
  }
}
