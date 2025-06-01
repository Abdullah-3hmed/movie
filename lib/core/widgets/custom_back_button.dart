import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 35.0,
        height: 35.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10.0),
          color: Colors.black38,
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
