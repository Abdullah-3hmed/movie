import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/color_manager.dart';

class CustomSectionTitle extends StatelessWidget {
  const CustomSectionTitle({
    super.key,
    required this.title,
    this.onPressed,
    this.seeAll = true,
  });

  final bool seeAll;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Container(
            width: 5.0,
            height: 18.0,
            decoration: BoxDecoration(
              color: ColorsManager.primaryColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          const SizedBox(width: 10.0),
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
          const Spacer(),
          if (seeAll)
            TextButton(
              onPressed: onPressed,
              child: Text(
                AppStrings.seeAll,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
