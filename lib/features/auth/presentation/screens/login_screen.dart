import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/auth/presentation/widgets/custom_login_button.dart';
import 'package:movie/features/auth/presentation/widgets/password_field.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 70.0),
              Text(
                AppStrings.welcomeToOurCommunity,
                textAlign: TextAlign.center,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 70.0),
              TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'User name',
                  hintText: 'User name',
                  labelStyle: textTheme.bodyMedium,
                  hintStyle: textTheme.bodyMedium,
                  filled: true,
                  fillColor: Colors.white.withAlpha(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsManager.darkPrimary,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const PasswordField(),
              const SizedBox(height: 16.0),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  AppStrings.forgetPassword,
                  style: textTheme.bodyMedium!.copyWith(
                    color: const Color(0xFF00CCCC),
                  ),
                ),
              ),
              const SizedBox(height: 180.0),
              CustomLoginButton(onPressed: () {}),
              const SizedBox(height: 136.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.dontHaveAccount,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white.withAlpha(153),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.register,
                      style: textTheme.bodyMedium!.copyWith(
                        color: const Color(0xFF00CCCC),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
