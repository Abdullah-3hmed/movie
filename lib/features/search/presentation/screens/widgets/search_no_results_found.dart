import 'package:flutter/material.dart';
import 'package:movie/core/util/app_strings.dart';

class SearchNoResultsFound extends StatelessWidget {
  const SearchNoResultsFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.noResults,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
