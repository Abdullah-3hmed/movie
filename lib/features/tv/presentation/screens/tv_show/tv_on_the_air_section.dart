import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TvAiringOnTheAirSection extends StatefulWidget {
  const TvAiringOnTheAirSection({super.key});

  @override
  State<TvAiringOnTheAirSection> createState() =>
      _TvAiringOnTheAirSectionState();
}

class _TvAiringOnTheAirSectionState extends State<TvAiringOnTheAirSection> {
  late final PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 385.0,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://i.pinimg.com/736x/bd/8c/99/bd8c998d2e1a2766775fb97151a3c9fd.jpg",
                    width: double.infinity,
                    height: 385,
                    fit: BoxFit.cover,
                  ),
                  PositionedDirectional(
                    start: 20.0,
                    bottom: 16.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Penny Dreadful",
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge!.copyWith(fontSize: 18.0),
                        ),
                        const SizedBox(height: 5.0),
                        RatingBar.builder(
                          itemBuilder:
                              (context, index) => const Icon(
                                SolarSystemIcons.star,
                                color: ColorsManager.ratingIconColor,
                              ),
                          initialRating: 5,
                          minRating: 1,
                          allowHalfRating: true,
                          itemCount: 10,
                          itemSize: 12.0,
                          onRatingUpdate: (_) {},
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          "From 3 users",
                          style: Theme.of(context).textTheme.bodyMedium,
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
          controller: _pageController,
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
