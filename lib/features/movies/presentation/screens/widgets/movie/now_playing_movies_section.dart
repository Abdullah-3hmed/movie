import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/movies_type.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/movies/cubit/movie/movie_cubit.dart';
import 'package:movie/features/movies/cubit/movie/movie_state.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/movie_list_view_item.dart';

class NowPlayingMoviesSection extends StatelessWidget {
  const NowPlayingMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      buildWhen:
          (previous, current) =>
              current.nowPlayingMoviesState != previous.nowPlayingMoviesState &&
              current.nowPlayingPage == 1,
      builder: (context, state) {
        switch (state.nowPlayingMoviesState) {
          case RequestStatus.success:
            return Column(
              children: [
                const SizedBox(height: 14.0),
                CustomSectionTitle(
                  title: AppStrings.nowPlayingMovies,
                  onPressed: () {
                    context.pushRoute(
                      SeeAllMoviesRoute(
                        title: AppStrings.nowPlayingMovies,
                        movieType: MoviesType.nowPlaying,
                        movieCubit: context.read<MovieCubit>(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 270.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: AppConstants.horizontalPadding,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder:
                        (context, index) => MovieListViewItem(
                          moviesModel: state.nowPlayingMovies[index],
                        ),
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 10.0),
                    itemCount: state.nowPlayingMovies.length,
                  ),
                ),
              ],
            );
          case RequestStatus.error:
            return SizedBox(
              height: 270.0,
              child: Center(
                child: Text(
                  state.nowPlayingErrorMessage,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
