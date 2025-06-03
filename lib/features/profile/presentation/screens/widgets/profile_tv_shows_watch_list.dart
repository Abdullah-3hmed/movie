import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/movie_list_view_item.dart';

class ProfileTvShowsWatchList extends StatelessWidget {
  const ProfileTvShowsWatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionTitle(
          title: AppStrings.tvShowsWatchList,
          onPressed: () {},
        ),
        SizedBox(
          height: 250.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
            physics: const BouncingScrollPhysics(),
            itemBuilder:
                (context, index) =>
                    const SizedBox(height: 250.0, child: MovieListViewItem()),
            separatorBuilder: (context, index) => const SizedBox(width: 10.0),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
