import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_divider.dart';
import 'package:movie/core/widgets/custom_section_title.dart';

class TvRecommendedSection extends StatelessWidget {
  const TvRecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider(),
        CustomSectionTitle(title: AppStrings.recommended, onPressed: () {}),
        SizedBox(
          height: 200.0,
          child: ListView.separated(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
            scrollDirection: Axis.horizontal,
            cacheExtent: 200.0,
            physics: const BouncingScrollPhysics(),
            itemBuilder:
                (context, index) => const SizedBox(
                  height: 200.0,
                  child: SizedBox.shrink(), //MovieDetailsListItem(),
                ),
            separatorBuilder: (context, index) => const SizedBox(width: 10.0),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
