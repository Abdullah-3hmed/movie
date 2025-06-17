import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/features/movies/cubit/movie/movie_cubit.dart';
import 'package:movie/features/tv/cubit/tv_cubit/tv_cubit.dart';


@RoutePage()
class BottomNavBarScreen extends StatelessWidget{
  const BottomNavBarScreen({super.key});

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
