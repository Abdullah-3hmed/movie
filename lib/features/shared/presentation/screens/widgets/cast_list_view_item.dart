import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
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
        transform: Matrix4.skewX(AppConstants.skew),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          child: Stack(
            children: [
              CustomCachedNetworkImage(
                imageUrl: castModel.image,
                width: 150.0,
                height: 200.0,
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
