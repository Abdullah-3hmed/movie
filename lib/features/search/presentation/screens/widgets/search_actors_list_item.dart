import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/features/search/data/search_actor_model.dart';

class SearchActorsListItem extends StatelessWidget {
  const SearchActorsListItem({super.key, required this.searchActorModel});
  final SearchActorModel searchActorModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(ActorDetailsRoute(actorId: searchActorModel.id));
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Transform(
              transform: Matrix4.skewX(AppConstants.skew),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(20.0),
                  ),
                  color: Colors.black26,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CustomCachedNetworkImage(
                        imageUrl: searchActorModel.backdropPath,
                        width: 140.0,
                        height: 180.0,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8.0,
                        children: [
                          Text(
                            searchActorModel.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${AppStrings.knownFor} : ${searchActorModel.knownForDepartment}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
