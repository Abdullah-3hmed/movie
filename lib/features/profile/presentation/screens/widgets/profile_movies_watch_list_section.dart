import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_section_title.dart';

class ProfileMoviesWatchListSection extends StatelessWidget {
  const ProfileMoviesWatchListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionTitle(
          title: AppStrings.moviesWatchList,
          onPressed: () {
            context.pushRoute(const WatchListRoute());
          },
        ),
        SizedBox(
          height: 250.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
            physics: const BouncingScrollPhysics(),
            itemBuilder:
                (context, index) => const SizedBox(
                  height: 250.0,
                  child: SizedBox(), //MovieListViewItem(),
                ),
            separatorBuilder: (context, index) => const SizedBox(width: 10.0),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
