import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/tv/cubit/tv_cubit/tv_cubit.dart';
import 'package:movie/features/tv/cubit/tv_cubit/tv_state.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_show/tv_list_view_item.dart';

class TvAiringTodaySection extends StatelessWidget {
  const TvAiringTodaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvState>(
      buildWhen:
          (previous, current) =>
              previous.tvAiringTodayState != current.tvAiringTodayState,
      builder: (context, state) {
        switch (state.tvAiringTodayState) {
          case RequestStatus.success:
            return Column(
              children: [
                const SizedBox(height: 15.0),
                CustomSectionTitle(
                  title: AppStrings.airingToDay,
                  onPressed: () {
                    context.pushRoute(
                      SeeAllTvShowsRoute(
                        title: AppStrings.airingToDay,
                        tvShows: state.tvAiringTodayShows,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  height: 245.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: AppConstants.horizontalPadding,
                    ),
                    itemBuilder:
                        (context, index) => SizedBox(
                          height: 245.0,
                          child: TvListViewItem(
                            tvModel: state.tvAiringTodayShows[index],
                          ),
                        ),
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 8.0),
                    itemCount: state.tvAiringTodayShows.length,
                  ),
                ),
              ],
            );
          case RequestStatus.error:
            return SizedBox(
              height: 245.0,
              child: Center(
                child: Text(
                  state.tvAiringTodayErrorMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
