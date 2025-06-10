import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/features/movies/data/movies_model.dart';

class MovieDetailsListItem extends StatelessWidget {
  const MovieDetailsListItem({super.key, required this.movieModel});

  final MoviesModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewX(AppConstants.skew),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
        child: InkWell(
          onTap: () {
            context.pushRoute(MovieDetailsRoute(movieId: movieModel.id));
          },
          child: Stack(
            children: [
              CustomCachedNetworkImage(
                imageUrl: movieModel.backdropPath,
                width: 150.0,
                height: 200.0,
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
                      movieModel.title,
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
