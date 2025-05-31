import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/widgets/custom_outline.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomOutline(
      width: 180.0,
      height: 50.0,
      strokeWidth: 1,
      radius: 10.0,
      onPressed: onPressed,
      gradient: const LinearGradient(
        colors: [ColorsManager.primaryColor, ColorsManager.secondaryColor],
      ),
      child: Text(
        AppStrings.login,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
