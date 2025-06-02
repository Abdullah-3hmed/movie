import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/tv_details_cast_section.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/tv_details_section.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/tv_recommended_section.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/tv_reviews_section.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/tv_similar_section.dart';

@RoutePage()
class TvOverviewScreen extends StatelessWidget {
  const TvOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: const [
          TvDetailsSection(),
          TvDetailsCastSection(),
          TvRecommendedSection(),
          TvSimilarSection(),
          TvReviewsSection(),
        ],
      ),
    );
    const CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: TvDetailsSection()),
        SliverToBoxAdapter(child: TvDetailsCastSection()),
        SliverToBoxAdapter(child: TvRecommendedSection()),
        SliverToBoxAdapter(child: TvSimilarSection()),
        SliverToBoxAdapter(child: TvReviewsSection()),
      ],
    );
  }
}
