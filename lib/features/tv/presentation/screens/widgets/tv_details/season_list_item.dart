import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/features/tv/data/season_model.dart';

class SeasonListItem extends StatelessWidget {
  const SeasonListItem({super.key, required this.seasonModel});
  final SeasonModel seasonModel;
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewX(-0.08),
      child: Container(
        height: 160.0,
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.black26,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CustomCachedNetworkImage(
                width: 120.0,
                height: 144.0,
                imageUrl: seasonModel.posterPath,
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5.0,
              children: [
                Text(
                  seasonModel.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "${AppStrings.releaseDate} ${seasonModel.releaseDate}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: ColorsManager.ratingIconColor,
                      size: 15.0,
                    ),
                    Text(
                      "${seasonModel.voteAverage}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
