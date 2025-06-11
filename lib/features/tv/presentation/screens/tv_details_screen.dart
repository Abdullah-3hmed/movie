import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/core/widgets/no_internet_widget.dart';
import 'package:movie/features/shared/presentation/screens/widgets/custom_loading.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_cubit.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_cubit_manager.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_state.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/tv_details_poster.dart';

@RoutePage()
class TvDetailsScreen extends StatelessWidget implements AutoRouteWrapper {
  const TvDetailsScreen({super.key, required this.tvId});

  final int tvId;

  @override
  Widget wrappedRoute(BuildContext context) {
    final result = getIt<TvDetailsCubitManager>().getOrCreate(tvId);
    if (result.isNew) {
      result.cubit.getAllTvDetails(tvId: tvId);
    }
    return BlocProvider.value(value: result.cubit, child: this);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: BlocBuilder<TvDetailsCubit, TvDetailsState>(
        buildWhen:
            (previous, current) =>
                previous.allTvDetailsState != current.allTvDetailsState,
        builder: (context, state) {
          switch (state.allTvDetailsState) {
            case RequestStatus.loading:
              return const CustomLoading();
            case RequestStatus.success:
              return AutoTabsRouter.tabBar(
                routes: const [TvOverviewRoute(), TvSeasonsRoute()],
                builder: (context, child, controller) {
                  return NestedScrollView(
                    physics: const BouncingScrollPhysics(),
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverToBoxAdapter(
                          child: TvDetailsPoster(
                            posterUrl: state.tvDetailsModel.posterPath,
                            videoId: state.tvDetailsModel.id,
                          ),
                        ),
                        SliverPersistentHeader(
                          delegate: _TabBarDelegate(
                            TabBar(
                              controller: controller,
                              tabs: const [
                                Tab(text: AppStrings.overView),
                                Tab(text: AppStrings.seasons),
                              ],
                            ),
                          ),
                        ),
                      ];
                    },
                    body: child,
                  );
                },
              );
            case RequestStatus.error:
              return NoInternetWidget(
                errorMessage: state.allTvDetailsErrorMessage,
                onPressed:
                    () async =>
                        getIt<TvDetailsCubitManager>().getOrCreate(tvId),
              );
            default:
              return const SizedBox.shrink();
          }
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
