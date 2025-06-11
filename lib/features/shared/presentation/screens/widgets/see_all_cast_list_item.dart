import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/features/shared/data/cast_model.dart';

class SeeAllCastListItem extends StatelessWidget {
  const SeeAllCastListItem({super.key, required this.castModel});

  final CastModel castModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(ActorDetailsRoute(actorId: castModel.id));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Transform(
          transform: Matrix4.skewX(AppConstants.skew),
          child: Container(
            height: 160.0,
            width: double.infinity,
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            decoration: const BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(20.0),
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: CustomCachedNetworkImage(
                    imageUrl: castModel.image,
                    width: 120.0,
                    height: 144.0,
                  ),
                ),
                const SizedBox(width: 16.0),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.0,
                    children: [
                      Text(
                        castModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        castModel.character,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
