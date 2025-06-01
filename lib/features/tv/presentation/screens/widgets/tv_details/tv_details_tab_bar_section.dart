import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';

class TvDetailsTabBarSection extends StatelessWidget {
  const TvDetailsTabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [TvOverviewRoute(), TvSeasonsRoute()],
      builder: (context, child, controller) {
        //final tabsRouter = AutoTabsRouter.of(context);
        return Column(
          children: [
            SizedBox(
              height: 40.0,
              child: TabBar(
                controller: controller,
                tabs: const [Tab(text: 'Overview'), Tab(text: 'Seasons')],
              ),
            ),
            Expanded(child: child),
          ],
        );
      },
    );
  }
}
