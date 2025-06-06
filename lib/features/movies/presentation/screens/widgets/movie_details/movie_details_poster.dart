import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/util/assets_manager.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/features/movies/data/movie_details/movie_details_model.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie_details/movie_details_clipper.dart';

class MovieDetailsPoster extends StatelessWidget {
  const MovieDetailsPoster({
    super.key,
    required this.posterHeight,
    required this.movieDetailsModel,
  });

  final double posterHeight;
  final MovieDetailsModel movieDetailsModel;

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
                  imageUrl: ApiConstants.imageUrl(movieDetailsModel.posterPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const PositionedDirectional(
              top: 60.0,
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
              Column(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  const SizedBox(height: 5.0),
                  Text(
                    "${movieDetailsModel.voteAverage} / 10",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    "${movieDetailsModel.voteCount}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
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
