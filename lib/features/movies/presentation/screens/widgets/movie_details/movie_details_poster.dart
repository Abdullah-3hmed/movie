import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/assets_manager.dart';
import 'package:movie/core/util/show_toast.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/features/movies/cubit/movie_details/movie_details_cubit.dart';
import 'package:movie/features/movies/cubit/movie_details/movie_details_state.dart';
import 'package:movie/features/movies/presentation/screens/widgets/custom_movies_watch_List_Icon.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/movie_details_clipper.dart';

class MovieDetailsPoster extends StatelessWidget {
  const MovieDetailsPoster({super.key, required this.posterHeight});

  final double posterHeight;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      buildWhen:
          (previous, current) =>
              previous.movieDetailsState != current.movieDetailsState,
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestStatus.success:
            return Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutCubic,
                      height: posterHeight,
                      width: double.infinity,
                      child: ClipPath(
                        clipper: MovieDetailsClipper(),
                        child: CustomCachedNetworkImage(
                          imageUrl: state.movieDetails.posterPath,
                          height: posterHeight,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    const PositionedDirectional(
                      top: 40.0,
                      start: 16.0,
                      child: CustomBackButton(),
                    ),
                    PositionedDirectional(
                      start: 0.0,
                      end: 0.0,
                      bottom: -25.0,
                      child: BlocListener<MovieDetailsCubit, MovieDetailsState>(
                        listenWhen:
                            (previous, current) =>
                                previous.trailerState != current.trailerState,
                        listener: (context, state) {
                          if (state.trailerState == RequestStatus.error) {
                            showToast(
                              message: state.trailerErrorMessage,
                              state: ToastStates.error,
                            );
                          }
                        },
                        child: GestureDetector(
                          onTap: () async {
                            String videoId = await context
                                .read<MovieDetailsCubit>()
                                .getMovieTrailer(
                                  movieId: state.movieDetails.id,
                                );
                            if (videoId.isNotEmpty && context.mounted) {
                              context.pushRoute(TrailerRoute(videoId: videoId));
                            }
                          },
                          child: SizedBox(
                            height: 60.0,
                            width: 60.0,
                            child: SvgPicture.asset(
                              AssetsManager.neonPlayButton,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow),
                          const SizedBox(height: 5.0),
                          Text(
                            "${state.movieDetails.voteAverage} / 10",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "${state.movieDetails.voteCount}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      CustomMoviesWatchListIcon(
                        moviesModel: state.movieDetails.toMoviesModel(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          case RequestStatus.error:
            return SizedBox(
              height: 350.0,
              child: Center(
                child: Text(
                  state.movieDetailsErrorMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
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
