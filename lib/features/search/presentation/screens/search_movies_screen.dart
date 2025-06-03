import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/features/shared/presentation/screens/widgets/see_all_and_search_list_view_item.dart';

@RoutePage()
class SearchMoviesScreen extends StatelessWidget {
  const SearchMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      cacheExtent: 200.0,
      itemBuilder:
          (context, index) => const SizedBox(
            height: 180.0,
            child: SeeAllAndSearchListViewItem(),
          ),
      separatorBuilder: (context, index) => const SizedBox(height: 16.0),
      itemCount: 10,
    );
  }
}
