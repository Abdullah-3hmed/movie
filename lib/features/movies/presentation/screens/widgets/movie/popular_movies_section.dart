import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/movie_list_view_item.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14.0),
        CustomSectionTitle(title: AppStrings.popularMovies, onPressed: () {}),
        SizedBox(
          height: 270.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => const MovieListViewItem(),
            separatorBuilder: (context, index) => const SizedBox(width: 10.0),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
