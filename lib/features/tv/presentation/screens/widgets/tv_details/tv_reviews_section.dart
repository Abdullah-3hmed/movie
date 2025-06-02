import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_divider.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/core/widgets/movie_review_item.dart';

class TvReviewsSection extends StatelessWidget {
  const TvReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider(),
        CustomSectionTitle(
          title: AppStrings.reviews,
          onPressed: () {},
          seeAll: false,
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 200.0,
          child: ListView.separated(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder:
                (context, index) =>
                    const SizedBox(height: 200.0, child: MovieReviewItem()),
            separatorBuilder: (context, index) => const SizedBox(width: 10.0),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
