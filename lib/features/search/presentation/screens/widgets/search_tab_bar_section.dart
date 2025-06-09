import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/util/app_strings.dart';

class SearchTabBarSection extends StatelessWidget {
  const SearchTabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AutoTabsRouter.tabBar(
        routes: const [
          SearchMoviesRoute(),
          SearchTvRoute(),
          SearchActorsRoute(),
        ],
        builder: (context, child, controller) {
          //final tabsRouter = AutoTabsRouter.of(context);
          return Column(
            children: [
              SizedBox(
                height: 40.0,
                child: TabBar(
                  controller: controller,
                  indicator: const BoxDecoration(),
                  tabs: [
                    Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color:
                            controller.index == 0
                                ? const Color(0xFF009999)
                                : null,
                      ),

                      child: const Tab(text: AppStrings.movies),
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color:
                            controller.index == 1
                                ? const Color(0xFF009999)
                                : null,
                      ),
                      child: const Tab(text: AppStrings.tvShows),
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color:
                            controller.index == 2
                                ? const Color(0xFF009999)
                                : null,
                      ),
                      child: const Tab(text: AppStrings.actors),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(child: child),
            ],
          );
        },
      ),
    );
  }
}
