import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/movies_type.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/features/auth/cubit/auth_cubit.dart';
import 'package:movie/features/auth/presentation/screens/login_screen.dart';
import 'package:movie/features/auth/presentation/screens/selection_screen.dart';
import 'package:movie/features/bottom_nab_bar/bottom_nav_bar.dart';
import 'package:movie/features/movies/cubit/movie/movie_cubit.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/movies/presentation/screens/movie_details_screen.dart';
import 'package:movie/features/movies/presentation/screens/movie_details_see_all_screen.dart';
import 'package:movie/features/movies/presentation/screens/movies_screen.dart';
import 'package:movie/features/movies/presentation/screens/see_all_movies_screen.dart';
import 'package:movie/features/profile/cubit/profile_cubit.dart';
import 'package:movie/features/profile/presentation/screens/profile_screen.dart';
import 'package:movie/features/profile/presentation/screens/see_all_movies_watch_list_screen.dart';
import 'package:movie/features/profile/presentation/screens/see_all_tv_watch_list_screen.dart';
import 'package:movie/features/search/presentation/screens/search_actors_screen.dart';
import 'package:movie/features/search/presentation/screens/search_movies_screen.dart';
import 'package:movie/features/search/presentation/screens/search_screen.dart';
import 'package:movie/features/search/presentation/screens/search_tv_screen.dart';
import 'package:movie/features/shared/data/cast_model.dart';
import 'package:movie/features/shared/presentation/screens/actor_details_screen.dart';
import 'package:movie/features/shared/presentation/screens/see_all_cast_screen.dart';
import 'package:movie/features/shared/presentation/screens/trailer_screen.dart';
import 'package:movie/features/splash/presentation/screens/splash_screen.dart';
import 'package:movie/features/tv/data/tv_model.dart';
import 'package:movie/features/tv/presentation/screens/see_all_tv_shows_screen.dart';
import 'package:movie/features/tv/presentation/screens/tv_details_screen.dart';
import 'package:movie/features/tv/presentation/screens/tv_overview_screen.dart';
import 'package:movie/features/tv/presentation/screens/tv_screen.dart';
import 'package:movie/features/tv/presentation/screens/tv_seasons_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: SplashTabRoute.page,
      children: [AutoRoute(initial: true, page: SplashRoute.page)],
    ),
    _buildCustomRoute(
      page: AuthRoute.page,
      children: [
        _buildCustomRoute(initial: true, page: SelectionRoute.page),
        _buildCustomRoute(page: LoginRoute.page),
      ],
    ),
    _buildCustomRoute(
      page: AuthenticatedRoute.page,
      children: [
        _buildCustomRoute(
          initial: true,
          page: BottomNavBarRoute.page,
          children: [
            _buildCustomRoute(initial: true, page: MoviesRoute.page),
            _buildCustomRoute(page: TvRoute.page),
            _buildCustomRoute(
              page: SearchRoute.page,
              children: [
                _buildCustomRoute(initial: true, page: SearchMoviesRoute.page),
                _buildCustomRoute(page: SearchTvRoute.page),
                _buildCustomRoute(page: SearchActorsRoute.page),
              ],
            ),
            _buildCustomRoute(page: ProfileRoute.page),
          ],
        ),
        _buildCustomRoute(page: MovieDetailsRoute.page),
        _buildCustomRoute(page: SeeAllMoviesRoute.page),
        _buildCustomRoute(
          page: TvDetailsRoute.page,
          children: [
            _buildCustomRoute(initial: true, page: TvOverviewRoute.page),
            _buildCustomRoute(page: TvSeasonsRoute.page),
          ],
        ),
        _buildCustomRoute(page: ActorDetailsRoute.page),
        _buildCustomRoute(page: SeeAllCastRoute.page),
        _buildCustomRoute(page: TrailerRoute.page),
        _buildCustomRoute(page: SeeAllTvShowsRoute.page),
        _buildCustomRoute(page: SeeAllTvWatchlistRoute.page),
        _buildCustomRoute(page: SeeAllMoviesWatchListRoute.page),
        _buildCustomRoute(page: MovieDetailsSeeAllRoute.page),
      ],
    ),
  ];

  CustomRoute _buildCustomRoute({
    bool initial = false,
    required PageInfo page,
    List<AutoRoute>? children,
  }) {
    return CustomRoute(
      initial: initial,
      page: page,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      duration: const Duration(milliseconds: 300),
      children: children,
    );
  }
}

@RoutePage(name: 'SplashTabRoute')
class Splash extends AutoRouter {
  const Splash({super.key});
}

@RoutePage(name: 'AuthRoute')
class Auth extends AutoRouter implements AutoRouteWrapper {
  const Auth({super.key});

  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocProvider(create: (context) => getIt<AuthCubit>(), child: this);
}

@RoutePage(name: 'AuthenticatedRoute')
class Authenticated extends AutoRouter implements AutoRouteWrapper {
  const Authenticated({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
    lazy: false,
    create: (context) => getIt<ProfileCubit>()..getProfileAndWatchLists(),
    child: this,
  );
}
