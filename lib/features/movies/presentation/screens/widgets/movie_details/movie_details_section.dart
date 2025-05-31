import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_divider.dart';

class MovieDetailsSection extends StatelessWidget {
  const MovieDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const CustomDivider(),
          Text(
            "Evil Dead Rise",
            style: theme.titleLarge!.copyWith(fontSize: 18.0),
          ),
          const SizedBox(height: 7.0),
          Text(
            "Horror/Fantasy/Slasher",
            style: theme.bodySmall!.copyWith(
              fontSize: 12.0,
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    AppStrings.year,
                    style: theme.bodyMedium!.copyWith(fontSize: 14.0),
                  ),
                  Text("2023", style: theme.bodyLarge),
                ],
              ),
              Column(
                children: [
                  Text(
                    AppStrings.country,
                    style: theme.bodyMedium!.copyWith(fontSize: 14.0),
                  ),
                  Text("USA", style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              Column(
                children: [
                  Text(
                    AppStrings.length,
                    style: theme.bodyMedium!.copyWith(fontSize: 14.0),
                  ),
                  Text("96 min", style: theme.bodyLarge),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            "A twisted tale of two estranged sisters whose reunion is cut short by the rise of flesh-possessing demons, thrusting them into a primal battle for survival as they face the most nightmarish version of family imaginable.",
            style: theme.bodyMedium,
          ),
          const CustomDivider(),
        ],
      ),
    );
  }
}
