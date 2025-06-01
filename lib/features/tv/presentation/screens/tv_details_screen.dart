import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/tv_details_poster.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/tv_details_tab_bar_section.dart';

@RoutePage()
class TvDetailsScreen extends StatelessWidget {
  const TvDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: TvDetailsPoster(posterHeight: 330.0)),
          SliverFillRemaining(child: TvDetailsTabBarSection()),
        ],
      ),
    );
  }
}
