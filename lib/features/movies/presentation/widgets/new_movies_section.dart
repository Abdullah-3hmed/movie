import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/movies/presentation/widgets/movie_list_view_item.dart';

class NewMoviesSection extends StatelessWidget {
  const NewMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: Column(
        children: [
          const SizedBox(height: 14.0),
          CustomSectionTitle(title: AppStrings.newMovies, onPressed: () {}),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const MovieListViewItem(),
              separatorBuilder: (context, index) => const SizedBox(width: 10.0),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
