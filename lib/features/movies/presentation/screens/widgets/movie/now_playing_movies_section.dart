import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NowPlayingMoviesSection extends StatefulWidget {
  const NowPlayingMoviesSection({super.key});

  @override
  State<NowPlayingMoviesSection> createState() =>
      _NowPlayingMoviesSectionState();
}

class _NowPlayingMoviesSectionState extends State<NowPlayingMoviesSection> {
  late final PageController controller;
  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 360.0,
          child: PageView.builder(
            controller: controller,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://i.pinimg.com/736x/bd/8c/99/bd8c998d2e1a2766775fb97151a3c9fd.jpg",
                    height: 360.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  PositionedDirectional(
                    start: 16.0,
                    bottom: 8.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Doctor Strange",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          "In The Multiverse Of  Madness",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(
                            color: const Color(0xFFD8D8D8),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 7.0),
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          allowHalfRating: true,
                          itemCount: 10,
                          itemSize: 20.0,
                          itemPadding: const EdgeInsets.symmetric(
                            horizontal: 1.0,
                          ),
                          itemBuilder:
                              (context, _) => const Icon(
                                Icons.star,
                                color: ColorsManager.ratingIconColor,
                              ),
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          "From 324 users",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(
                            color: const Color(0xFFD8D8D8),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 12.0),
        SmoothPageIndicator(
          controller: controller,
          count: 5,
          effect: const ExpandingDotsEffect(
            activeDotColor: ColorsManager.primaryColor,
            dotColor: Colors.white,
            dotHeight: 10.0,
            dotWidth: 10.0,
            spacing: 5.0,
          ),
        ),
      ],
    );
  }
}
