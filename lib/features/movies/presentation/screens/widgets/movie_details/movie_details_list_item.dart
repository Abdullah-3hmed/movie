import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/util/color_manager.dart';

class MovieDetailsListItem extends StatelessWidget {
  const MovieDetailsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewX(-.08),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://i.pinimg.com/736x/bd/8c/99/bd8c998d2e1a2766775fb97151a3c9fd.jpg",
              width: 150.0,
              height: 200.0,
              fit: BoxFit.cover,
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
                      Text("8.5", style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  Text(
                    "doctor strange",
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
    );
  }
}
