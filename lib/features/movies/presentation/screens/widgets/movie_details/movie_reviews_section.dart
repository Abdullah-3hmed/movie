import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_divider.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/movies/cubit/movie_details/movie_details_cubit.dart';
import 'package:movie/features/movies/cubit/movie_details/movie_details_state.dart';
import 'package:movie/features/shared/data/review_model.dart';
import 'package:movie/features/shared/presentation/screens/widgets/movie_review_item.dart';

class MovieReviewsSection extends StatelessWidget {
  const MovieReviewsSection({super.key, required this.reviews});

  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider(),
        CustomSectionTitle(
          title: AppStrings.reviews,
          onPressed: () {},
          seeAll: false,
        ),
        const SizedBox(height: 16.0),
        BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          buildWhen:
              (previous, current) =>
                  previous.reviewsState != current.reviewsState,
          builder: (context, state) {
            switch (state.reviewsState) {
              case RequestStatus.loading:
                return const SizedBox.shrink();
              case RequestStatus.success:
                return SizedBox(
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
                          child: MovieReviewItem(review: reviews[index]),
                        ),
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 10.0),
                    itemCount: reviews.length,
                  ),
                );
              case RequestStatus.error:
                return SizedBox(
                  height: 200.0,
                  child: Center(
                    child: Text(
                      state.reviewsErrorMessage,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
