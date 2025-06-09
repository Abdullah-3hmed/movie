import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/search/bloc/search_bloc.dart';
import 'package:movie/features/search/presentation/screens/widgets/search_tab_bar_section.dart';

@RoutePage()
class SearchScreen extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocProvider(create: (context) => getIt<SearchBloc>(), child: this);

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  final Bloc bloc = context.read<SearchBloc>();
                  final currentTab = context.select<SearchBloc, int>(
                    (bloc) => bloc.state.currentTabIndex,
                  );
                  return TextField(
                    onChanged: (value) {
                      if (currentTab == 0) {
                        bloc.add(SearchMovieEvent(movieName: value));
                      } else if (currentTab == 1) {
                        bloc.add(SearchTvShowsEvent(tvShowName: value));
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: Colors.white.withValues(alpha: 0.6)),
                      prefixIcon: Icon(
                        SolarSystemIcons.search,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              const SearchTabBarSection(),
            ],
          ),
        ),
      ),
    );
  }
}
