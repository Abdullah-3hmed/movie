import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_divider.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_cubit.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_state.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_show/tv_list_view_item.dart';

class TvRecommendedSection extends StatelessWidget {
  const TvRecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsCubit, TvDetailsState>(
      buildWhen:
          (previous, current) =>
              previous.tvRecommendedState != current.tvRecommendedState,
      builder: (context, state) {
        switch (state.tvRecommendedState) {
          case RequestStatus.loading:
            return const SizedBox.shrink();
          case RequestStatus.success:
            return Column(
              children: [
                const CustomDivider(),
                CustomSectionTitle(
                  title: AppStrings.recommended,
                  onPressed: () {
                    context.pushRoute(
                      SeeAllTvShowsRoute(
                        title: AppStrings.recommended,
                        tvShows: state.tvRecommended,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 200.0,
                  child: ListView.separated(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: AppConstants.horizontalPadding,
                    ),
                    scrollDirection: Axis.horizontal,
                    cacheExtent: 200.0,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder:
                        (context, index) => SizedBox(
                          height: 200.0,
                          child: TvListViewItem(
                            tvModel: state.tvRecommended[index],
                          ), //MovieDetailsListItem(),
                        ),
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 10.0),
                    itemCount: state.tvRecommended.length,
                  ),
                ),
              ],
            );
          case RequestStatus.error:
            return SizedBox(
              height: 200.0,
              child: Center(
                child: Text(
                  state.tvRecommendedErrorMessage,
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
