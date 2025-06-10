import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_divider.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/shared/presentation/screens/widgets/review_list_view_item.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_cubit.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_state.dart';

class TvReviewsSection extends StatelessWidget {
  const TvReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsCubit, TvDetailsState>(
      buildWhen:
          (previous, current) =>
              previous.tvReviewsState != current.tvReviewsState,
      builder: (context, state) {
        switch (state.tvReviewsState) {
          case RequestStatus.success:
            return state.tvReviews.isEmpty
                ? const SizedBox.shrink()
                : Column(
                  children: [
                    const CustomDivider(),
                    CustomSectionTitle(
                      title: AppStrings.reviews,
                      onPressed: () {},
                      seeAll: false,
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 200.0,
                      child: ListView.separated(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 16.0,
                        ),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder:
                            (context, index) => SizedBox(
                              height: 200.0,
                              child: ReviewListViewItem(
                                review: state.tvReviews[index],
                              ),
                            ),
                        // MovieReviewItem()),
                        separatorBuilder:
                            (context, index) => const SizedBox(width: 10.0),
                        itemCount: state.tvReviews.length,
                      ),
                    ),
                  ],
                );
          case RequestStatus.error:
            return SizedBox(
              height: 200.0,
              child: Center(
                child: Text(
                  state.tvReviewsErrorMessage,
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
