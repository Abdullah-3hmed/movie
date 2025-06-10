import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/media_type.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/util/assets_manager.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/util/geners.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/profile/cubit/profile_cubit.dart';
import 'package:movie/features/profile/cubit/profile_state.dart';

class SeeAllMoviesListItem extends StatelessWidget {
  const SeeAllMoviesListItem({super.key, required this.movieModel});

  final MoviesModel movieModel;

  @override
  Widget build(BuildContext context) {
    final genres = getGenreNames(movieModel.genreIds).join(', ');
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
                      child: CachedNetworkImage(
                        imageUrl: ApiConstants.imageUrl(
                          movieModel.backdropPath,
                        ),
                        errorWidget:
                            (context, url, error) => Image.network(
                              AssetsManager.errorPoster,
                              fit: BoxFit.cover,
                            ),
                        width: 140.0,
                        height: 180.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          movieModel.title.length > 12
                              ? '${movieModel.title.substring(0, 12)}...'
                              : movieModel.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 7.0),
                        Text(
                          genres.length > 25
                              ? '${genres.substring(0, 25)}...'
                              : genres,
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
                              "From ${movieModel.voteCount} users",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 5.0),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              top: 10.0,
              end: 15.0,
              child: BlocSelector<ProfileCubit, ProfileState, Set<int>>(
                selector: (state) {
                  return state.inMoviesWatchlist;
                },
                builder: (context, inMoviesWatchlist) {
                  return IconButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      context.read<ProfileCubit>().addAndRemoveFromWatchList(
                        mediaType: MediaType.movie,
                        mediaId: movieModel.id,
                        moviesModel: movieModel,
                      );
                    },
                    icon:
                        inMoviesWatchlist.contains(movieModel.id)
                            ? const Icon(
                              SolarSystemIcons.saved,
                              color: ColorsManager.darkPrimary,
                            )
                            : const Icon(
                              SolarSystemIcons.unsaved,
                              color: ColorsManager.darkPrimary,
                            ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
