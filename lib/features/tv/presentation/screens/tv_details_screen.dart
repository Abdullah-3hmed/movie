import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/tv_details_poster.dart';

@RoutePage()
class TvDetailsScreen extends StatefulWidget {
  const TvDetailsScreen({super.key});

  @override
  State<TvDetailsScreen> createState() => _TvDetailsScreenState();
}

class _TvDetailsScreenState extends State<TvDetailsScreen> {
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
      child: AutoTabsRouter.tabBar(
        routes: const [TvOverviewRoute(), TvSeasonsRoute()],
        builder: (context, child, controller) {
          return ValueListenableBuilder<double>(
            valueListenable: posterHeight,
            builder: (context, height, _) {
              return NestedScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverToBoxAdapter(
                      child: TvDetailsPoster(posterHeight: height),
                    ),
                    SliverPersistentHeader(
                      delegate: _TabBarDelegate(
                        TabBar(
                          controller: controller,
                          tabs: const [
                            Tab(text: 'Overview'),
                            Tab(text: 'Seasons'),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: child,
              );
            },
          );
        },
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => tabBar;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
