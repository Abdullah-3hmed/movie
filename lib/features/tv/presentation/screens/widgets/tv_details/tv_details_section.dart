import 'package:flutter/material.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_divider.dart';

class TvDetailsSection extends StatelessWidget {
  const TvDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(height: 5.0),
                  Text("7.6 / 10"),
                  SizedBox(height: 5.0),
                  Text("100.755"),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  SolarSystemIcons.unsaved,
                  size: 30.0,
                  color: Color(0xFF007373),
                ),
              ),
            ],
          ),
        ),
        const CustomDivider(),
        Text("Game Of Thrones", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8.0),
        Text(
          "TV Series · 2011 ‧ Drama",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text("S8 · 72 episodes", style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  AppStrings.year,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 14.0),
                ),
                Text("2023", style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            Column(
              children: [
                Text(
                  AppStrings.country,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 14.0),
                ),
                Text("USA", style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            Column(
              children: [
                Text(
                  AppStrings.from,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 14.0),
                ),
                Text("AMC", style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 32.0),
          child: Text(
            "Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
