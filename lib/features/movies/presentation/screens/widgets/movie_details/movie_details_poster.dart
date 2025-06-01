import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/assets_manager.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/movie_details_clipper.dart';

class MovieDetailsPoster extends StatelessWidget {
  const MovieDetailsPoster({super.key, required this.posterHeight});
  final double posterHeight;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutCubic,
              height: posterHeight,
              width: double.infinity,
              child: ClipPath(
                clipper: MovieDetailsClipper(),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQr8FcgAq31cIByH4nveSOqH7a0soJ7fLq1Q&s",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const PositionedDirectional(
              top: 40.0,
              start: 16.0,
              child: CustomBackButton(),
            ),
            PositionedDirectional(
              start: 0.0,
              end: 0.0,
              bottom: -25.0,
              child: SvgPicture.asset(AssetsManager.neonPlayButton),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(height: 5.0),
                  Text("7.6 / 10"),
                  SizedBox(height: 5.0),
                  Text("100.755"),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  SolarSystemIcons.unsaved,
                  size: 30.0,
                  color: Color(0xFF007373),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
