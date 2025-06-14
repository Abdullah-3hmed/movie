import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:movie/core/enums/movies_type.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/movies/cubit/movie/movie_cubit.dart';
import 'package:movie/features/movies/cubit/movie/movie_state.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/see_all_movies_list_item.dart';
import 'package:movie/features/shared/presentation/screens/widgets/custom_loading.dart';

@RoutePage()
class SeeAllMoviesScreen extends StatefulWidget {
  const SeeAllMoviesScreen({
    super.key,
    required this.title,
    required this.movieType,
    required this.movieCubit,
  });

  final String title;
  final MoviesType movieType;
  final MovieCubit movieCubit;

  @override
  State<SeeAllMoviesScreen> createState() => _SeeAllMoviesScreenState();
}

class _SeeAllMoviesScreenState extends State<SeeAllMoviesScreen> {
  late final ScrollController _scrollController;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_isLoadingMore || !_scrollController.hasClients) return;
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _isLoadingMore = true;

      switch (widget.movieType) {
        case MoviesType.nowPlaying:
          widget.movieCubit.loadMoreNowPlayingMovies();
          break;
        case MoviesType.topRated:
          widget.movieCubit.loadMoreTopRatedMovies();
          break;
        case MoviesType.popular:
          widget.movieCubit.loadMorePopularMovies();
          break;
      }
    }
  }

  void _resetLoading(RequestStatus status) {
    if (_isLoadingMore &&
        (status == RequestStatus.success || status == RequestStatus.error)) {
      _isLoadingMore = false;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InternetStateManager(
      child: CustomScaffold(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const CustomBackButton(),
                    const SizedBox(width: 16.0),
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Expanded(
                  child: BlocProvider.value(
                    value: widget.movieCubit,
                    child: BlocBuilder<MovieCubit, MovieState>(
                      buildWhen: (previous, current) {
                        switch (widget.movieType) {
                          case MoviesType.nowPlaying:
                            return previous.nowPlayingMoviesState !=
                                current.nowPlayingMoviesState;
                          case MoviesType.topRated:
                            return previous.topRatedMoviesState !=
                                current.topRatedMoviesState;
                          case MoviesType.popular:
                            return previous.popularMoviesState !=
                                current.popularMoviesState;
                        }
                      },
                      builder: (context, state) {
                        late List<MoviesModel> movies;
                        late RequestStatus status;
                        // String errorMessage = "";
                        switch (widget.movieType) {
                          case MoviesType.nowPlaying:
                            movies = state.nowPlayingMovies;
                            status = state.nowPlayingMoviesState;
                            //errorMessage = state.nowPlayingErrorMessage;
                            break;
                          case MoviesType.topRated:
                            movies = state.topRatedMovies;
                            status = state.topRatedMoviesState;
                            //errorMessage = state.topRatedErrorMessage;
                            break;
                          case MoviesType.popular:
                            movies = state.popularMovies;
                            status = state.popularMoviesState;
                            //errorMessage = state.popularErrorMessage;
                            break;
                        }
                        _resetLoading(status);
                        return ListView.separated(
                          controller: _scrollController,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index == movies.length) {
                              switch (status) {
                                case RequestStatus.loading:
                                  return const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Center(child: CustomLoading()),
                                  );
      
                                case RequestStatus.error:
                                  return const SizedBox.shrink();
                                default:
                                  return const SizedBox.shrink();
                              }
                            }
      
                            return SeeAllMoviesListItem(
                              movieModel: movies[index],
                            );
                          },
                          separatorBuilder:
                              (context, index) => const SizedBox(height: 16.0),
                          itemCount: movies.length + 1,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
