import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/tv_details_poster.dart';

@RoutePage()
class TvDetailsScreen extends StatelessWidget {
  const TvDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: AutoTabsRouter.tabBar(
        routes: const [TvOverviewRoute(), TvSeasonsRoute()],
        builder: (context, child, controller) {
          return NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                const SliverToBoxAdapter(child: TvDetailsPoster()),
                SliverPersistentHeader(
                  delegate: _TabBarDelegate(
                    TabBar(
                      controller: controller,
                      tabs: const [Tab(text: 'Overview'), Tab(text: 'Seasons')],
                    ),
                  ),
                ),
              ];
            },
            body: child,
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
