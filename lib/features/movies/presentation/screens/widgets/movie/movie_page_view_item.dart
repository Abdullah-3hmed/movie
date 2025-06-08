import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/features/movies/data/up_coming_movies_model.dart';

class MoviePageViewItem extends StatelessWidget {
  const MoviePageViewItem({super.key, required this.upComingMoviesModel});

  final UpComingMoviesModel upComingMoviesModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(MovieDetailsRoute(movieId: upComingMoviesModel.id));
      },
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: ApiConstants.imageUrl(upComingMoviesModel.backdropPath),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 360.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          PositionedDirectional(
            start: 16.0,
            bottom: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  upComingMoviesModel.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4.0),
                Text(
                  "${AppStrings.releaseDate} ${upComingMoviesModel.releaseDate}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: const Color(0xFFD8D8D8),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 7.0),
                RatingBar.builder(
                  initialRating: upComingMoviesModel.voteAverage,
                  minRating: 1,
                  allowHalfRating: true,
                  itemSize: 20.0,
                  itemCount: upComingMoviesModel.voteAverage.toInt(),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder:
                      (context, _) => const Icon(
                        Icons.star,
                        color: ColorsManager.ratingIconColor,
                      ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(height: 4.0),
                Text(
                  "From ${upComingMoviesModel.voteCount} users",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: const Color(0xFFD8D8D8),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
