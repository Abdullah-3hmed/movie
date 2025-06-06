import 'package:flutter/material.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/color_manager.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({
    super.key,
    required this.errorMessage,
    this.onPressed,
  });
  final String errorMessage;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(SolarSystemIcons.wifi, color: Colors.white, size: 200.0),
        const SizedBox(height: 20),
        Text(errorMessage, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 20),
        MaterialButton(
          height: 50.0,
          minWidth: 180.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: ColorsManager.darkPrimary,
          onPressed: onPressed,
          child: Text(
            "Try Again",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
