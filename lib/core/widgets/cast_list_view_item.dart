import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';

class CastListViewItem extends StatelessWidget {
  const CastListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(const TvActorDetailsRoute());
      },
      child: Transform(
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
                start: 10.0,
                bottom: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alyssa Sutherland",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "Elie",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white.withValues(alpha: 0.67),
                      ),
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
