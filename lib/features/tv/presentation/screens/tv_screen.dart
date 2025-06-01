import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/tv/presentation/screens/tv_show/poplar_tv_show_section.dart';
import 'package:movie/features/tv/presentation/screens/tv_show/top_rated_tv_show_section.dart';
import 'package:movie/features/tv/presentation/screens/tv_show/tv_airing_today_section.dart';
import 'package:movie/features/tv/presentation/screens/tv_show/tv_on_the_air_section.dart';

@RoutePage()
class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: TvAiringOnTheAirSection()),
          SliverToBoxAdapter(child: TvAiringTodaySection()),
          SliverToBoxAdapter(child: PoplarTvShowSection()),
          SliverToBoxAdapter(child: TopRatedTvShowSection()),
        ],
      ),
    );
  }
}
