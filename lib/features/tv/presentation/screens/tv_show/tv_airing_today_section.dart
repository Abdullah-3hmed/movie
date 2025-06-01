import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/tv/presentation/screens/tv_show/tv_list_view_item.dart';

class TvAiringTodaySection extends StatelessWidget {
  const TvAiringTodaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15.0),
        CustomSectionTitle(title: AppStrings.airingToDay, onPressed: () {}),
        const SizedBox(height: 15.0),
        SizedBox(
          height: 245.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
            itemBuilder: (context, index) => const TvListViewItem(),
            separatorBuilder: (context, index) => const SizedBox(width: 8.0),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
