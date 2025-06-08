import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/features/tv/data/on_the_air_tv_model.dart';

class TvPageViewItem extends StatelessWidget {
  const TvPageViewItem({super.key, required this.tvModel});

  final OnTheAirTvModel tvModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(const TvDetailsRoute());
      },
      child: Stack(
        children: [
          CustomCachedNetworkImage(
            width: double.infinity,
            height: 385.0,
            imageUrl: tvModel.backdropPath,
          ),
          PositionedDirectional(
            start: 20.0,
            bottom: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tvModel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 18.0),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "${AppStrings.releaseDate} ${tvModel.firstAirDate}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 5.0),
                RatingBar.builder(
                  initialRating: tvModel.voteAverage,
                  minRating: 1,
                  allowHalfRating: true,
                  itemSize: 20.0,
                  itemCount: tvModel.voteAverage.toInt(),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder:
                      (context, _) => const Icon(
                        Icons.star,
                        color: ColorsManager.ratingIconColor,
                      ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(height: 5.0),
                Text(
                  "From ${tvModel.voteCount} users",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
