import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/movies/cubit/movie_cubit.dart';
import 'package:movie/features/movies/cubit/movie_state.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/movie_list_view_item.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14.0),
        CustomSectionTitle(title: AppStrings.popularMovies, onPressed: () {}),
        BlocBuilder<MovieCubit, MovieState>(
          buildWhen:
              (previous, current) =>
                  previous.popularMoviesState != current.popularMoviesState,
          builder: (context, state) {
            switch (state.popularMoviesState) {
              case RequestStatus.loading:
                return const SizedBox.shrink();
              case RequestStatus.success:
                return SizedBox(
                  height: 270.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 24.0,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder:
                        (context, index) => MovieListViewItem(
                          moviesModel: state.popularMovies[index],
                        ),
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 10.0),
                    itemCount: state.popularMovies.length,
                  ),
                );
              case RequestStatus.error:
                return Center(child: Text(state.popularErrorMessage));
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
