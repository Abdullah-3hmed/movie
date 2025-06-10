import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/util/geners.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/features/tv/data/tv_model.dart';

class TvListViewItem extends StatelessWidget {
  const TvListViewItem({super.key, required this.tvModel});

  final TvModel tvModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(TvDetailsRoute(tvId: tvModel.id));
      },
      child: Transform(
        transform: Matrix4.skewX(AppConstants.skew),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Stack(
            children: [
              CustomCachedNetworkImage(
                height: 245.0,
                width: 180.0,
                imageUrl: tvModel.backdropPath,
              ),
              PositionedDirectional(
                bottom: 10.0,
                start: 5.0,
                end: 5.0,
                child: Column(
                  children: [
                    Text(
                      tvModel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      getGenreNames(tvModel.genreIds).join(', '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(fontSize: 8.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            "TMDB ${tvModel.voteAverage} ",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        Flexible(
                          child: RatingBarIndicator(
                            rating: tvModel.voteAverage,
                            itemSize: 12.0,
                            itemCount: tvModel.voteAverage.toInt(),
                            itemPadding: const EdgeInsets.symmetric(
                              horizontal: 1.0,
                            ),
                            itemBuilder:
                                (context, _) => const Icon(
                                  Icons.star,
                                  color: ColorsManager.ratingIconColor,
                                ),
                          ),
                        ),
                      ],
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
