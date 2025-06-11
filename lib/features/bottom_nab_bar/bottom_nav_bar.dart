import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/features/movies/cubit/movie/movie_cubit.dart';
import 'package:movie/features/tv/cubit/tv_cubit/tv_cubit.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_cubit_manager.dart';

import '../movies/cubit/movie_details/movie_details_cubit_manager.dart';

@RoutePage()
class BottomNavBarScreen extends StatefulWidget implements AutoRouteWrapper {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => getIt<MovieCubit>()..getAllHomeMovies(),
          child: this,
        ),
        BlocProvider(
          lazy: false,
          create: (context) => getIt<TvCubit>()..getAllTvShows(),
          child: this,
        ),
      ],
      child: this,
    );
  }
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen>
    with AutoRouteAwareStateMixin<BottomNavBarScreen> {
  @override
  void didPopNext() {
    getIt<MovieDetailsCubitManager>().clearAll();
    getIt<TvDetailsCubitManager>().clearAll();
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
