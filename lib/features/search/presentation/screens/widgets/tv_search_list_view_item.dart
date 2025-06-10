import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/util/geners.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/features/tv/data/tv_model.dart';
import 'package:movie/features/tv/presentation/screens/widgets/custom_tv_watch_list_icon.dart';

class TvSearchListViewItem extends StatelessWidget {
  const TvSearchListViewItem({super.key, required this.tvModel});

  final TvModel tvModel;

  @override
  Widget build(BuildContext context) {
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
              transform: Matrix4.skewX(AppConstants.skew),
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
                    const SizedBox(width: 10.0),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tvModel.name,
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
                              Expanded(
                                child: Text(
                                  getGenreNames(tvModel.genreIds).join(', '),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
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
                                AppStrings.fromUser(tvModel.voteCount),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
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
          PositionedDirectional(
            top: 10.0,
            end: 15.0,
            child: CustomTvWatchListIcon(tvModel: tvModel),
          ),
        ],
      ),
    );
  }
}
