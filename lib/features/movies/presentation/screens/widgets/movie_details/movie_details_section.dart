import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_divider.dart';
import 'package:movie/features/movies/cubit/movie_details_cubit.dart';
import 'package:movie/features/movies/cubit/movie_details_state.dart';
import 'package:movie/features/movies/data/movie_details/movie_details_model.dart';

class MovieDetailsSection extends StatelessWidget {
  const MovieDetailsSection({super.key, required this.movieDetailsModel});

  final MovieDetailsModel movieDetailsModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      buildWhen:
          (previous, current) =>
              previous.movieDetailsState != current.movieDetailsState,
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestStatus.loading:
            return const SizedBox.shrink();
          case RequestStatus.success:
            final theme = Theme.of(context).textTheme;
            return Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const CustomDivider(),
                  Text(
                    movieDetailsModel.title,
                    style: theme.titleLarge!.copyWith(fontSize: 18.0),
                  ),
                  const SizedBox(height: 7.0),
                  Text(
                    movieDetailsModel.geners.join(", "),
                    style: theme.bodySmall!.copyWith(
                      fontSize: 12.0,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            AppStrings.year,
                            style: theme.bodyMedium!.copyWith(fontSize: 14.0),
                          ),
                          Text(
                            "${movieDetailsModel.year}",
                            style: theme.bodyLarge,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            AppStrings.country,
                            style: theme.bodyMedium!.copyWith(fontSize: 14.0),
                          ),
                          Text(
                            movieDetailsModel.country,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            AppStrings.length,
                            style: theme.bodyMedium!.copyWith(fontSize: 14.0),
                          ),
                          Text(
                            "${movieDetailsModel.length} ${AppStrings.min}",
                            style: theme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(movieDetailsModel.overview, style: theme.bodyMedium),
                  const CustomDivider(),
                ],
              ),
            );
          case RequestStatus.error:
            return SizedBox(
              height: 300.0,
              child: Center(
                child: Text(
                  state.movieDetailsErrorMessage,
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
