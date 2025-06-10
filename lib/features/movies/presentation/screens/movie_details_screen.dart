import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/core/widgets/no_internet_widget.dart';
import 'package:movie/features/movies/cubit/movie_details/movie_details_cubit.dart';
import 'package:movie/features/movies/cubit/movie_details/movie_details_cubit_manager.dart';
import 'package:movie/features/movies/cubit/movie_details/movie_details_state.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/cast_section.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/movie_details_poster.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/movie_details_section.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/movie_reviews_section.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/recommended_section.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/similar_section.dart';
import 'package:movie/features/shared/presentation/screens/widgets/custom_loading.dart';

@RoutePage()
class MovieDetailsScreen extends StatefulWidget implements AutoRouteWrapper {
  const MovieDetailsScreen({super.key, required this.movieId});

  final int movieId;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    final result = getIt<MovieDetailsCubitManager>().getOrCreate(movieId);
    if (result.isNew) {
      result.cubit.getAllMoviesDetails(movieId: movieId);
    }
    return BlocProvider.value(value: result.cubit, child: this);
  }
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final ValueNotifier<double> posterHeight = ValueNotifier<double>(330.0);
  final double maxHeight = 330.0;

  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final direction = scrollController.position.userScrollDirection;
    final offset = scrollController.offset;
    if (direction == ScrollDirection.reverse) {
      final newHeight = (maxHeight - offset).clamp(0.0, maxHeight);
      if (posterHeight.value != newHeight) {
        posterHeight.value = newHeight;
      }
    } else if (direction == ScrollDirection.forward) {
      final scrollExtent = scrollController.position.maxScrollExtent;
      final scrollPercentage = scrollExtent == 0 ? 0 : offset / scrollExtent;

      if (scrollPercentage < 0.05 && posterHeight.value != maxHeight) {
        posterHeight.value = maxHeight;
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    posterHeight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: ValueListenableBuilder<double>(
        valueListenable: posterHeight,
        builder: (context, height, _) {
          return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
            buildWhen:
                (previous, current) =>
                    previous.allMovieDetailsState !=
                    current.allMovieDetailsState,
            builder: (context, state) {
              switch (state.movieDetailsState) {
                case RequestStatus.loading:
                  return const CustomLoading();
                case RequestStatus.success:
                  return CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: MovieDetailsPoster(
                          posterHeight: posterHeight.value,
                        ),
                      ),
                      const SliverToBoxAdapter(child: MovieDetailsSection()),
                      const SliverToBoxAdapter(child: CastSection()),
                      const SliverToBoxAdapter(child: RecommendedSection()),
                      const SliverToBoxAdapter(child: SimilarSection()),
                      const SliverToBoxAdapter(child: MovieReviewsSection()),
                      const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
                    ],
                  );
                case RequestStatus.error:
                  return NoInternetWidget(
                    errorMessage: state.allMovieDetailsErrorMessage,
                    onPressed: () {
                      getIt<MovieDetailsCubitManager>().getOrCreate(
                        widget.movieId,
                      );
                    },
                  );

                default:
                  return const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
