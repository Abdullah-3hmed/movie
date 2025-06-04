import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/util/show_toast.dart';
import 'package:movie/features/auth/cubit/auth_cubit.dart';
import 'package:movie/features/auth/cubit/auth_state.dart';
import 'package:movie/features/auth/presentation/screens/widgets/custom_login_button.dart';
import 'package:movie/features/auth/presentation/screens/widgets/password_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidateMode;
  String userName = "";
  String password = "";

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _autoValidateMode = AutovalidateMode.disabled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: AutofillGroup(
        child: Column(
          children: [
            TextFormField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.username],
              onSaved: (value) {
                print(value);
                userName = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'User name must not be empty';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'User name',
                hintText: 'User name',
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
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
            PasswordField(
              onSaved: (value) {
                print(value);
                password = value!;
              },
              onFieldSubmitted: (_) async {
                await _onSubmit();
              },
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                AppStrings.forgetPassword,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(0xFF00CCCC),
                ),
              ),
            ),
            const SizedBox(height: 150.0),
            BlocConsumer<AuthCubit, AuthState>(
              listenWhen:
                  (previous, current) =>
                      previous.loginStatus != current.loginStatus,
              buildWhen:
                  (previous, current) =>
                      previous.loginStatus != current.loginStatus,
              listener: (context, state) {
                if (state.loginStatus == RequestStatus.success) {
                  context.replaceRoute(const BottomNavBarRoute());
                }
                if (state.loginStatus == RequestStatus.error) {
                  showToast(
                    message: state.loginErrorMessage,
                    state: ToastStates.error,
                  );
                }
              },
              builder: (BuildContext context, state) {
                return CustomLoginButton(
                  isLoading: state.loginStatus == RequestStatus.loading,
                  onPressed: () async {
                    await _onSubmit();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await context.read<AuthCubit>().login(
        userName: userName,
        password: password,
      );
    } else {
      setState(() {
        _autoValidateMode = AutovalidateMode.always;
      });
      TextInput.finishAutofillContext();
    }
  }
}
