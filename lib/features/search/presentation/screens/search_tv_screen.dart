import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/features/search/presentation/screens/widgets/tv_search_list_view_item.dart';

@RoutePage()
class SearchTvScreen extends StatelessWidget {
  const SearchTvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      cacheExtent: 200.0,
      padding: const EdgeInsetsDirectional.symmetric(vertical: 16.0),
      itemBuilder:
          (context, index) =>
              const SizedBox(height: 180.0, child: TvSearchListViewItem()),
      separatorBuilder: (context, index) => const SizedBox(height: 16.0),
      itemCount: 10,
    );
  }
}
