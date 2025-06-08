import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/shared/presentation/screens/widgets/cast_list_view_item.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_cubit.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_state.dart';

class TvDetailsCastSection extends StatelessWidget {
  const TvDetailsCastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsCubit, TvDetailsState>(
      buildWhen:
          (previous, current) => previous.tvCastState != current.tvCastState,
      builder: (context, state) {
        switch (state.tvCastState) {
          case RequestStatus.loading:
            return const SizedBox.shrink();
          case RequestStatus.success:
            return Column(
              children: [
                CustomSectionTitle(
                  title: AppStrings.cast,
                  onPressed: () {
                    context.pushRoute(SeeAllCastRoute(cast: state.tvCast));
                  },
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 200.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    cacheExtent: 200.0,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: AppConstants.horizontalPadding,
                    ),
                    itemBuilder:
                        (context, index) => SizedBox(
                          height: 200.0,
                          child: CastListViewItem(
                            castModel: state.tvCast[index],
                          ),
                        ),
                    //CastListViewItem()),
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 8.0),
                    itemCount: state.tvCast.length,
                  ),
                ),
              ],
            );
          case RequestStatus.error:
            return SizedBox(
              height: 200.0,
              child: Center(
                child: Text(
                  state.tvCastErrorMessage,
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
