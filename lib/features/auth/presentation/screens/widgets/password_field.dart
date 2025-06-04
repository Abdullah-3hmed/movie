import 'package:flutter/material.dart';
import 'package:movie/core/util/color_manager.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved, this.onFieldSubmitted});
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      obscureText: isObscure,
      onSaved: widget.onSaved,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password must not be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        filled: true,
        fillColor: Colors.white.withAlpha(15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.darkPrimary),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.errorColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            isObscure = !isObscure;
            setState(() {});
          },
          icon:
              isObscure
                  ? const Icon(Icons.visibility_outlined)
                  : const Icon(Icons.visibility_off_outlined),
          color: Colors.white.withAlpha(60),
        ),
      ),
    );
  }
}
