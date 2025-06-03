import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/features/search/presentation/screens/widgets/search_actors_list_item.dart';

@RoutePage()
class SearchActorsScreen extends StatelessWidget {
  const SearchActorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:
          (context, index) =>
              const SizedBox(height: 180.0, child: SearchActorsListItem()),
      separatorBuilder: (context, index) => const SizedBox(height: 16.0),
      itemCount: 10,
    );
  }
}
