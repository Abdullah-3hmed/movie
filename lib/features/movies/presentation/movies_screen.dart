import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/movies/presentation/widgets/new_movies_section.dart';
import 'package:movie/features/movies/presentation/widgets/now_playing_movies_section.dart';
import 'package:movie/features/movies/presentation/widgets/popular_movies_section.dart';
import 'package:movie/features/movies/presentation/widgets/top_rated_movies_section.dart';

@RoutePage()
class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: NowPlayingMoviesSection()),
          SliverToBoxAdapter(child: NewMoviesSection()),
          SliverToBoxAdapter(child: TopRatedMoviesSection()),
          SliverToBoxAdapter(child: PopularMoviesSection()),
        ],
      ),
    );
  }
}
