import 'package:flutter/material.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/color_manager.dart';

class MovieReviewItem extends StatelessWidget {
  const MovieReviewItem({super.key});

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
        color: Colors.black,
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
              Text("7", style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 5.0),
          Text(
            "Abdullah Ahmed",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 5.0),
          Text(
            "I have to say, starting out, that Sam Raimi's original EVIL DEAD trilogy has been a favourite of mine ever since I saw it as a teenager. While EVIL DEAD 2 was the best of the three films, for me, a pitch-perfect comedy/horror, and ARMY OF DARKNESS was a funny, cheesy comedy, the first film was a gruelling terror flick made a grea ......",
            maxLines: 7,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
