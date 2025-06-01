import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/cast_section.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/movie_details_poster.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/movie_details_section.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/movie_reviews_section.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/recommended_section.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/similar_section.dart';

@RoutePage()
class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final ValueNotifier<double> posterHeight = ValueNotifier<double>(330.0);
  final double maxHeight = 330.0;
  final double minHeight = 180.0;

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
      final newHeight = (maxHeight - offset).clamp(minHeight, maxHeight);
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
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: MovieDetailsPoster(posterHeight: posterHeight.value),
              ),
              const SliverToBoxAdapter(child: MovieDetailsSection()),
              const SliverToBoxAdapter(child: CastSection()),
              const SliverToBoxAdapter(child: RecommendedSection()),
              const SliverToBoxAdapter(child: SimilarSection()),
              const SliverToBoxAdapter(child: MovieReviewsSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
            ],
          );
        },
      ),
    );
  }
}
