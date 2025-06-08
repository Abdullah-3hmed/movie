import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/util/assets_manager.dart';
import 'package:movie/features/shared/data/cast_model.dart';

class CastListViewItem extends StatelessWidget {
  const CastListViewItem({super.key, required this.castModel});

  final CastModel castModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(ActorDetailsRoute(actorId: castModel.id));
      },
      child: Transform(
        transform: Matrix4.skewX(-.05),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl:
                    castModel.image.isNotEmpty
                        ? ApiConstants.imageUrl(castModel.image)
                        : AssetsManager.errorPoster,
                errorWidget:
                    (context, url, error) => Image.network(
                      AssetsManager.errorPoster,
                      fit: BoxFit.cover,
                    ),
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
                      castModel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      castModel.character,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
