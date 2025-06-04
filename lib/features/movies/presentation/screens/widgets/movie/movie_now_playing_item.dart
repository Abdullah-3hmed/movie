import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/features/movies/data/movie/now_playing_model.dart';

class MovieNowPlayingItem extends StatelessWidget {
  const MovieNowPlayingItem({super.key, required this.movieNowPlayingModel});

  final MovieNowPlayingModel movieNowPlayingModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: ApiConstants.imageUrl(movieNowPlayingModel.posterPath),
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
                movieNowPlayingModel.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4.0),
              Text(
                "Release date: ${movieNowPlayingModel.releaseDate}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: const Color(0xFFD8D8D8),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 7.0),
              RatingBar.builder(
                initialRating: movieNowPlayingModel.voteAverage,
                minRating: 1,
                allowHalfRating: true,
                itemSize: 20.0,
                itemCount: movieNowPlayingModel.voteAverage.toInt(),
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
                "From ${movieNowPlayingModel.voteCount} users",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: const Color(0xFFD8D8D8),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
