import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/app_routes_observer.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/config/theme_manager.dart';
import 'package:movie/core/services/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.defaultTheme(),
      routerConfig: getIt<AppRouter>().config(
        navigatorObservers: () => [AppRoutesObserver(), AutoRouteObserver()],
      ),
    );
  }
}
