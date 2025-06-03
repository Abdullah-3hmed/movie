import 'package:flutter/material.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_show/tv_list_view_item.dart';

class TvShowSection extends StatelessWidget {
  const TvShowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 245.0,
      child: ListView.separated(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
        physics: const BouncingScrollPhysics(),
        cacheExtent: 200.0,
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) =>
                const SizedBox(height: 245.0, child: TvListViewItem()),
        separatorBuilder: (context, index) => const SizedBox(height: 8.0),
        itemCount: 5,
      ),
    );
  }
}
