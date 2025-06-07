import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_section_title.dart';

class TvDetailsCastSection extends StatelessWidget {
  const TvDetailsCastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionTitle(
          title: AppStrings.cast,
          onPressed: () {},
          seeAll: false,
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 200.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            cacheExtent: 200.0,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
            itemBuilder:
                (context, index) =>
                    const SizedBox(height: 200.0, child: SizedBox.shrink()),
            //CastListViewItem()),
            separatorBuilder: (context, index) => const SizedBox(width: 8.0),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
