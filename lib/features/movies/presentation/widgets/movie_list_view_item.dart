import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/core/util/color_manager.dart';

class MovieListViewItem extends StatelessWidget {
  const MovieListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewX(-.15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://i.pinimg.com/736x/bd/8c/99/bd8c998d2e1a2766775fb97151a3c9fd.jpg",
              width: 200.0,
              height: 300.0,
              fit: BoxFit.cover,
            ),
            PositionedDirectional(
              bottom: 30.0,
              start: 0.0,
              end: 0.0,
              child: Column(
                children: [
                  Text(
                    "doctor strange",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "In The Multiverse Of  Madness",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "TMDB 7.6",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      RatingBar.builder(
                        initialRating: 5,
                        minRating: 1,
                        allowHalfRating: true,
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
