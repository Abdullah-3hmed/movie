import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/util/assets_manager.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/widgets/custom_outline.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';

@RoutePage()
class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 4),
          const Image(image: AssetImage(AssetsManager.appLogo)),
          const Spacer(flex: 2),
          Text(
            "Your guide to movies, TV \n shows and celebrities",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          CustomOutline(
            width: 180.0,
            height: 50.0,
            strokeWidth: 1,
            radius: 10.0,
            onPressed: () {},
            gradient: const LinearGradient(
              colors: [
                ColorsManager.primaryColor,
                ColorsManager.secondaryColor,
              ],
            ),
            child: Text("login", style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: 16.0),
          MaterialButton(
            onPressed: () {},
            height: 50.0,
            minWidth: 180.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: ColorsManager.darkPrimary,
            child: Text(
              "Sign up",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
