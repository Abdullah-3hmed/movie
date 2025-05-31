import 'package:auto_route/auto_route.dart';
import 'package:movie/features/auth/presentation/screens/login_screen.dart';
import 'package:movie/features/auth/presentation/screens/selection_screen.dart';
import 'package:movie/features/bottom_nab_bar/bottom_nav_bar.dart';
import 'package:movie/features/movies/presentation/movies_screen.dart';
import 'package:movie/features/profile/presentation/profile_screen.dart';
import 'package:movie/features/search/presentation/search_screen.dart';
import 'package:movie/features/splash/presentation/screens/splash_screen.dart';
import 'package:movie/features/tv/presentation/tv_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      //initial: true,
      page: SplashTabRoute.page,
      children: [AutoRoute(initial: true, page: SplashRoute.page)],
    ),
    _buildCustomRoute(
      //  initial: true,
      page: AuthRoute.page,
      children: [
        _buildCustomRoute(initial: true, page: SelectionRoute.page),
        _buildCustomRoute(page: LoginRoute.page),
      ],
    ),
    _buildCustomRoute(
      initial: true,
      page: BottomNavBarRoute.page,
      children: [
        _buildCustomRoute(initial: true, page: MoviesRoute.page),
        _buildCustomRoute(page: TvRoute.page),
        _buildCustomRoute(page: SearchRoute.page),
        _buildCustomRoute(page: ProfileRoute.page),
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
class Auth extends AutoRouter {
  const Auth({super.key});
}
