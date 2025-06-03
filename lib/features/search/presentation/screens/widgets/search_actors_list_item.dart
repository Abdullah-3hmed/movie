import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/app_strings.dart';

class SearchActorsListItem extends StatelessWidget {
  const SearchActorsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Transform(
            transform: Matrix4.skewX(-0.08),
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
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQr8FcgAq31cIByH4nveSOqH7a0soJ7fLq1Q&s",
                      width: 140.0,
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8.0,
                    children: [
                      Text(
                        "The Godfather",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${AppStrings.knownFor} : Acting",
                        style: Theme.of(context).textTheme.bodyMedium,
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
    );
  }
}
