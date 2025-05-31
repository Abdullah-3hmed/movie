import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/cast_section.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/movie_details_poster.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/movie_details_section.dart';

@RoutePage()
class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
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
    final offset = scrollController.offset;
    final newHeight = (maxHeight - offset).clamp(0.0, maxHeight);
    if (posterHeight.value != newHeight) {
      posterHeight.value = newHeight;
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
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: MovieDetailsPoster(posterHeight: posterHeight),
              ),
              const SliverToBoxAdapter(child: MovieDetailsSection()),
              const SliverToBoxAdapter(child: CastSection()),
            ],
          );
        },
      ),
    );
  }
}
