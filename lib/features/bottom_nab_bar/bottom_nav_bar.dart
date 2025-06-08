import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/services/service_locator.dart';

import '../movies/cubit/movie_details/movie_details_cubit_manager.dart';

@RoutePage()
class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen>
    with AutoRouteAwareStateMixin<BottomNavBarScreen> {
  @override
  void didPopNext() {
    getIt<MovieDetailsCubitManager>().clearAll();
    print('didPopNext');
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [MoviesRoute(), TvRoute(), SearchRoute(), ProfileRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(SolarSystemIcons.movie),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: Icon(SolarSystemIcons.tv),
              label: 'TV',
            ),
            BottomNavigationBarItem(
              icon: Icon(SolarSystemIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(SolarSystemIcons.person),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
