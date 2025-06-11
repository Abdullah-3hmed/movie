import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/see_all_movies_list_item.dart';

@RoutePage()
class MovieDetailsSeeAllScreen extends StatelessWidget {
  const MovieDetailsSeeAllScreen({
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
                      (context, index) =>
                          SeeAllMoviesListItem(movieModel: movies[index]),
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
