import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/util/geners.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/features/tv/data/tv_model.dart';

class TvSearchListViewItem extends StatelessWidget {
  const TvSearchListViewItem({super.key, required this.tvModel});

  final TvModel tvModel;

  @override
  Widget build(BuildContext context) {
    final String genreNames = getGenreNames(tvModel.genreIds).join(', ');
    return InkWell(
      onTap: () {
        context.pushRoute(TvDetailsRoute(tvId: tvModel.id));
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Transform(
              transform: Matrix4.skewX(-0.05),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 16.0,
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
                        imageUrl: tvModel.backdropPath,
                        width: 140.0,
                        height: 180.0,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tvModel.name.length > 12
                              ? tvModel.name.substring(0, 12)
                              : tvModel.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          spacing: 5.0,
                          children: [
                            Text(
                              tvModel.year,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              genreNames.length > 15
                                  ? genreNames.substring(0, 15)
                                  : genreNames,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 7.0),
                        Row(
                          children: [
                            const Icon(
                              SolarSystemIcons.star,
                              size: 16.0,
                              color: ColorsManager.ratingIconColor,
                            ),
                            Text(
                              "  ${tvModel.voteAverage}",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(width: 22.0),
                            Text(
                              "From ${tvModel.voteCount} users",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          PositionedDirectional(
            top: 10.0,
            end: 15.0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                SolarSystemIcons.unsaved,
                color: Color(0xFF007373),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
