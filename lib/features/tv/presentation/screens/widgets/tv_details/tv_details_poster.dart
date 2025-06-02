import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/util/assets_manager.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/tv_details_clipper.dart';

class TvDetailsPoster extends StatelessWidget {
  const TvDetailsPoster({super.key, required this.posterHeight});

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
                clipper: TvDetailsClipper(),
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
              bottom: 10.0,
              child: SvgPicture.asset(AssetsManager.neonPlayButton),
            ),
          ],
        ),
      ],
    );
  }
}
