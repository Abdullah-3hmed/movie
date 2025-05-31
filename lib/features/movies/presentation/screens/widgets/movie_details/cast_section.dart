import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/cast_list_view_item.dart';
import 'package:movie/core/widgets/custom_section_title.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionTitle(title: AppStrings.cast, onPressed: () {}),
        SizedBox(
          height: 200.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
            itemBuilder: (context, index) => const CastListViewItem(),
            separatorBuilder: (context, index) => const SizedBox(width: 8.0),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
