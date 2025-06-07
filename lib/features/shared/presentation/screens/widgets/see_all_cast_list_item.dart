import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/util/assets_manager.dart';
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
          transform: Matrix4.skewX(-0.05),
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
                  child: CachedNetworkImage(
                    imageUrl:
                        castModel.image.isNotEmpty
                            ? ApiConstants.imageUrl(castModel.image)
                            : AssetsManager.errorPoster,
                    errorWidget:
                        (context, url, error) => Image.network(
                          AssetsManager.errorPoster,
                          width: 120.0,
                          height: 144.0,
                          fit: BoxFit.cover,
                        ),
                    width: 120.0,
                    height: 144.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5.0,
                  children: [
                    Text(
                      castModel.name.length > 20
                          ? '${castModel.name.substring(0, 20)}...'
                          : castModel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      castModel.character.length > 25
                          ? '${castModel.character.substring(0, 25)}...'
                          : castModel.character,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
