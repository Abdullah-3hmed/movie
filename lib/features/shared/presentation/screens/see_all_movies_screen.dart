import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/movies/data/movie/movies_model.dart';
import 'package:movie/features/shared/presentation/screens/widgets/see_all_and_search_list_view_item.dart';

@RoutePage()
class SeeAllMoviesScreen extends StatelessWidget {
  const SeeAllMoviesScreen({
    super.key,
    required this.title,
    required this.movies,
  });
  final String title;
  final List<MoviesModel> movies;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const CustomBackButton(),
                  const SizedBox(width: 16.0),
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder:
                      (context, index) => SeeAllAndSearchListViewItem(
                        movieModel: movies[index],
                      ),
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 16.0),
                  itemCount: movies.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
