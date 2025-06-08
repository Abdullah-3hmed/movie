import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/util/assets_manager.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/features/movies/data/movies_model.dart';

class MovieDetailsListItem extends StatelessWidget {
  const MovieDetailsListItem({super.key, required this.movieModel});

  final MoviesModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewX(-.05),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
        child: InkWell(
          onTap: () {
            context.pushRoute(
              MovieDetailsRoute(
                movieId: movieModel.id,
                key: ValueKey(movieModel.id),
              ),
            );
          },
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl:
                    movieModel.backdropPath.isNotEmpty
                        ? ApiConstants.imageUrl(movieModel.backdropPath)
                        : AssetsManager.errorPoster,
                errorWidget:
                    (context, url, error) => Image.network(
                      AssetsManager.errorPoster,
                      fit: BoxFit.cover,
                    ),
                width: 150.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              PositionedDirectional(
                start: 15.0,
                bottom: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: ColorsManager.ratingIconColor,
                          size: 15.0,
                        ),
                        Text(
                          "${movieModel.voteAverage}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Text(
                      movieModel.title.length > 18
                          ? '${movieModel.title.substring(0, 18)}...'
                          : movieModel.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
