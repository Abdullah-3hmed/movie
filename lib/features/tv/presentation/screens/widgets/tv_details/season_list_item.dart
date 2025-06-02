import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/util/color_manager.dart';

class SeasonListItem extends StatelessWidget {
  const SeasonListItem({super.key});

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
              child: CachedNetworkImage(
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQr8FcgAq31cIByH4nveSOqH7a0soJ7fLq1Q&s",
                width: 120.0,
                height: 144.0,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5.0,
              children: [
                Text("Season 1", style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  "release at : 2015-09-08",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: ColorsManager.ratingIconColor,
                      size: 15.0,
                    ),
                    Text(" 7.6", style: Theme.of(context).textTheme.bodyMedium),
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
