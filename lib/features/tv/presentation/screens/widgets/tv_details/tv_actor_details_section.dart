import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/core/widgets/custom_divider.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/tv_actor_details_biography.dart';

class TvActorDetailsSection extends StatelessWidget {
  const TvActorDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(20.0),
              ),
              child: CachedNetworkImage(
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXxOGhzcdu7URxDFw3HDAE7mKacg-Z4kA2WA&s",
                width: double.infinity,
                height: 450.0,
                fit: BoxFit.cover,
              ),
            ),
            const PositionedDirectional(
              top: 60.0,
              start: 16.0,
              child: CustomBackButton(),
            ),
            PositionedDirectional(
              bottom: 10.0,
              start: 16.0,
              child: Text(
                "Tom Hardy",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    SolarSystemIcons.birthday,
                    size: 22.0,
                    color: ColorsManager.inActiveColor,
                  ),
                  Text(
                    "   11 November 1974",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(
                    SolarSystemIcons.location,
                    size: 22.0,
                    color: ColorsManager.inActiveColor,
                  ),
                  Text(
                    "   los angeles, california, usa",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
        const CustomSectionTitle(title: AppStrings.biography, seeAll: false),
        const SizedBox(height: 8.0),
        const TvActorDetailsBiography(),
        const CustomDivider(),
        CustomSectionTitle(title: AppStrings.tvShows, onPressed: () {}),
      ],
    );
  }
}
