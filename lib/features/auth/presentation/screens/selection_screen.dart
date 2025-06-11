import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/assets_manager.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/auth/cubit/auth_cubit.dart';
import 'package:movie/features/auth/presentation/screens/widgets/custom_login_button.dart';

@RoutePage()
class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 4),
          const Image(image: AssetImage(AssetsManager.appLogo)),
          const Spacer(flex: 2),
          Text(
            AppStrings.welcomeGuide,
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
          ),
          const Spacer(),
          PrimaryButton(
            text: AppStrings.login,
            onPressed: () => context.pushRoute(const LoginRoute()),
          ),
          const SizedBox(height: 16.0),
          MaterialButton(
            onPressed: () async {
              await context.read<AuthCubit>().signUp();
            },
            height: 50.0,
            minWidth: 180.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: ColorsManager.darkPrimary,
            child: Text(AppStrings.register, style: textTheme.titleLarge),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
