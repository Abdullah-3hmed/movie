import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/color_manager.dart';

class TvListViewItem extends StatelessWidget {
  const TvListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewX(-0.08),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://i.pinimg.com/736x/bd/8c/99/bd8c998d2e1a2766775fb97151a3c9fd.jpg",
              height: 245.0,
              width: 180.0,
              fit: BoxFit.cover,
            ),
            PositionedDirectional(
              bottom: 10.0,
              start: 0.0,
              end: 0.0,
              child: Column(
                children: [
                  Text(
                    "Doctor Strange",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "2023 Action, Adventure",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(fontSize: 8.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "TMDB 8.5 ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      RatingBar.builder(
                        itemBuilder:
                            (context, index) => const Icon(
                              SolarSystemIcons.star,
                              color: ColorsManager.ratingIconColor,
                            ),
                        initialRating: 5,
                        minRating: 1,
                        allowHalfRating: true,
                        itemSize: 8.0,
                        onRatingUpdate: (_) {},
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
