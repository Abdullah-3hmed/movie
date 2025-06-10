import 'package:flutter/material.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/color_manager.dart';

class SearchScreenInitialWidget extends StatelessWidget {
  const SearchScreenInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          SolarSystemIcons.search,
          color: ColorsManager.primaryColor.withValues(alpha: 0.7),
          size: 100.0,
        ),
        const SizedBox(height: 16.0),
        Text(
          AppStrings.searchForWhatYouWant,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: ColorsManager.primaryColor.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          "${AppStrings.movies}, ${AppStrings.tvShows}, ${AppStrings.actors}",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: ColorsManager.primaryColor.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
