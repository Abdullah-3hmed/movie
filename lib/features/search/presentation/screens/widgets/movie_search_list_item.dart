import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/util/geners.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/movies/presentation/screens/widgets/custom_movies_watch_List_Icon.dart';

class MovieSearchListItem extends StatelessWidget {
  const MovieSearchListItem({super.key, required this.movieModel});

  final MoviesModel movieModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(MovieDetailsRoute(movieId: movieModel.id));
      },
      child: Transform(
        transform: Matrix4.skewX(-0.05),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(20.0),
                  ),
                  color: Colors.black26,
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
                          Row(
                            spacing: 5.0,
                            children: [
                              Text(
                                movieModel.year,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Expanded(
                                child: Text(
                                  getGenreNames(movieModel.genreIds).join(', '),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ],
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
            ),
            PositionedDirectional(
              top: 10.0,
              end: 15.0,
              child: CustomMoviesWatchListIcon(moviesModel: movieModel),
            ),
          ],
        ),
      ),
    );
  }
}
