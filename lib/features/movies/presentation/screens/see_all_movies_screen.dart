import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/movies_type.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/movies/cubit/movie/movie_cubit.dart';
import 'package:movie/features/movies/cubit/movie/movie_state.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/see_all_movies_list_item.dart';

@RoutePage()
class SeeAllMoviesScreen extends StatefulWidget {
  const SeeAllMoviesScreen({
    super.key,
    required this.title,
    required this.movies,
    required this.movieType,
  });

  final String title;
  final List<MoviesModel> movies;
  final MoviesType movieType;

  @override
  State<SeeAllMoviesScreen> createState() => _SeeAllMoviesScreenState();
}

class _SeeAllMoviesScreenState extends State<SeeAllMoviesScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent / 2) {
      final cubit = context.read<MovieCubit>();
      switch (widget.movieType) {
        case MoviesType.nowPlaying:
          cubit.loadMoreNowPlayingMovies();
          break;
        case MoviesType.topRated:
          cubit.loadMoreTopRatedMovies();
          break;
        case MoviesType.popular:
          cubit.loadMorePopularMovies();
          break;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                child: BlocBuilder<MovieCubit, MovieState>(
                  builder: (context, state) {
                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder:
                          (context, index) => SeeAllMoviesListItem(
                            movieModel: widget.movies[index],
                          ),
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 16.0),
                      itemCount: widget.movies.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
