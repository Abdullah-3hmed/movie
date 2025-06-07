import 'package:flutter/material.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/features/shared/data/review_model.dart';

class MovieReviewItem extends StatelessWidget {
  const MovieReviewItem({super.key, required this.review});
  final ReviewModel review;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 110,
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 12.0,
        horizontal: 10.0,
      ),
      decoration: const BoxDecoration(
        color: ColorsManager.reviewCardColor,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(
                SolarSystemIcons.star,
                color: ColorsManager.ratingIconColor,
                size: 15.0,
              ),
              const SizedBox(width: 5.0),
              Text(
                "${review.rating}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Text(
            review.author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 5.0),
          Text(
            review.content,
            maxLines: 7,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
