import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/movies/cubit/movie_cubit.dart';
import 'package:movie/features/movies/cubit/movie_state.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/now_playing_movies_section.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/popular_movies_section.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/top_rated_movies_section.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/up_coming_movies_section.dart';

@RoutePage()
class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: BlocBuilder<MovieCubit, MovieState>(
        buildWhen:
            (previous, current) =>
                previous.allMoviesState != current.allMoviesState,
        builder: (context, state) {
          return state.allMoviesState == RequestStatus.loading
              ? Center(child: Lottie.asset("assets/lottie/neon_loading.json"))
              : const CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: UpComingMoviesSection()),
                  SliverToBoxAdapter(child: NowPlayingMoviesSection()),
                  SliverToBoxAdapter(child: TopRatedMoviesSection()),
                  SliverToBoxAdapter(child: PopularMoviesSection()),
                ],
              );
        },
      ),
    );
  }
}
