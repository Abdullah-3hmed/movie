import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/util/assets_manager.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/util/geners.dart';
import 'package:movie/features/movies/data/movies_model.dart';

class MovieListViewItem extends StatelessWidget {
  const MovieListViewItem({super.key, required this.moviesModel});
  final MoviesModel moviesModel;
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewX(-.05),
      child: InkWell(
        onTap: () {
          context.pushRoute(MovieDetailsRoute(movieId: moviesModel.id));
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: CachedNetworkImage(
                imageUrl: ApiConstants.imageUrl(moviesModel.backdropPath),
                errorWidget:
                    (context, url, error) => Image.network(
                      AssetsManager.errorPoster,
                      fit: BoxFit.cover,
                    ),
                width: 200.0,
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
            PositionedDirectional(
              bottom: 30.0,
              start: 5.0,
              end: 5.0,
              child: Column(
                children: [
                  Text(
                    moviesModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    getGenreNames(moviesModel.genreIds).join(', '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "TMDB${moviesModel.voteAverage}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      RatingBar.builder(
                        initialRating: moviesModel.voteAverage,
                        minRating: 1,
                        allowHalfRating: true,
                        itemCount: moviesModel.voteAverage.toInt(),
                        itemSize: 10.0,
                        itemPadding: const EdgeInsets.symmetric(
                          horizontal: 1.0,
                        ),
                        itemBuilder:
                            (context, _) => const Icon(
                              Icons.star,
                              color: ColorsManager.ratingIconColor,
                            ),
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
