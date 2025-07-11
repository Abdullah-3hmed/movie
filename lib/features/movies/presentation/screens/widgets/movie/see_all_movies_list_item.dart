import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/media_type.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/util/geners.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/movies/presentation/screens/widgets/custom_movies_watch_list_icon.dart';
import 'package:movie/features/profile/cubit/profile_cubit.dart';

class SeeAllMoviesListItem extends StatelessWidget {
  const SeeAllMoviesListItem({
    super.key,
    required this.movieModel,
    this.isWatchList = false,
  });

  final MoviesModel movieModel;
  final bool isWatchList;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction:
          isWatchList ? DismissDirection.startToEnd : DismissDirection.none,
      onDismissed: (_) {
        context.read<ProfileCubit>().addAndRemoveFromMoviesWatchList(
          movieId: movieModel.id,
        );
      },
      child: InkWell(
        onTap: () {
          context.pushRoute(MovieDetailsRoute(movieId: movieModel.id));
        },
        child: Transform(
          transform: Matrix4.skewX(AppConstants.skew),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CustomCachedNetworkImage(
                        imageUrl: movieModel.backdropPath,
                        width: 140.0,
                        height: 180.0,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            movieModel.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 7.0),
                          Text(
                            getGenreNames(movieModel.genreIds).join(', '),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 7.0),
                          Row(
                            children: [
                              const Icon(
                                SolarSystemIcons.star,
                                size: 16.0,
                                color: ColorsManager.ratingIconColor,
                              ),
                              Text(
                                "  ${movieModel.voteAverage}",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(width: 22.0),
                              Text(
                                AppStrings.fromUser(movieModel.voteCount),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5.0),
                  ],
                ),
              ),
              if (!isWatchList)
                PositionedDirectional(
                  top: 10.0,
                  end: 15.0,
                  child: CustomMoviesWatchListIcon(moviesModel: movieModel),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
