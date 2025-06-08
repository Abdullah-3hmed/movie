import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_divider.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/movies/cubit/actor/actor_cubit.dart';
import 'package:movie/features/movies/cubit/actor/actor_state.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/shared/presentation/screens/widgets/movie_details_list_item.dart';

class TvShowSection extends StatelessWidget {
  const TvShowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider(),
        CustomSectionTitle(
          title: AppStrings.tvShows,
          onPressed: () {
            final List<MoviesModel> movies =
                context.read<ActorCubit>().state.actorMovies;
            context.pushRoute(
              SeeAllMoviesRoute(title: AppStrings.tvShows, movies: movies),
            );
          },
        ),
        BlocBuilder<ActorCubit, ActorState>(
          builder: (context, state) {
            switch (state.actorMoviesState) {
              case RequestStatus.loading:
                return const SizedBox.shrink();
              case RequestStatus.success:
                return SizedBox(
                  height: 200.0,
                  child: ListView.separated(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: AppConstants.horizontalPadding,
                    ),
                    physics: const BouncingScrollPhysics(),
                    cacheExtent: 200.0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:
                        (context, index) => SizedBox(
                          height: 200.0,
                          child: MovieDetailsListItem(
                            movieModel: state.actorMovies[index],
                          ),
                        ),
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 8.0),
                    itemCount: state.actorMovies.length,
                  ),
                );
              case RequestStatus.error:
                return SizedBox(
                  height: 200.0,
                  child: Center(
                    child: Text(
                      state.actorMoviesErrorMessage,
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
