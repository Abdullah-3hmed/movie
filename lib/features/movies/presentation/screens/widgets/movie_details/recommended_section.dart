import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_divider.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/movies/cubit/movie_details/movie_details_cubit.dart';
import 'package:movie/features/movies/cubit/movie_details/movie_details_state.dart';
import 'package:movie/features/shared/presentation/screens/widgets/movie_details_list_item.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      buildWhen:
          (previous, current) =>
              previous.recommendedState != current.recommendedState,
      builder: (context, state) {
        switch (state.recommendedState) {
          case RequestStatus.success:
            return state.recommendedMovies.isEmpty
                ? const SizedBox.shrink()
                : Column(
                  children: [
                    const CustomDivider(),
                    CustomSectionTitle(
                      title: AppStrings.recommended,
                      onPressed: () {
                        context.pushRoute(
                          MovieDetailsSeeAllRoute(
                            title: AppStrings.recommended,
                            movies: state.recommendedMovies,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 200.0,
                      child: ListView.separated(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: AppConstants.horizontalPadding,
                        ),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder:
                            (context, index) => MovieDetailsListItem(
                              movieModel: state.recommendedMovies[index],
                            ),
                        separatorBuilder:
                            (context, index) => const SizedBox(width: 10.0),
                        itemCount: state.recommendedMovies.length,
                      ),
                    ),
                  ],
                );
          case RequestStatus.error:
            return SizedBox(
              height: 200.0,
              child: Center(
                child: Text(
                  state.recommendedErrorMessage,
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
