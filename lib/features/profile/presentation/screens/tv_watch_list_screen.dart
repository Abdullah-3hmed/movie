import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/tv/data/tv_model.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_show/see_all_tv_shows_list_item.dart';

@RoutePage()
class TvWatchListScreen extends StatelessWidget {
  const TvWatchListScreen({
    super.key,
    required this.title,
    required this.tvShows,
  });
  final String title;
  final List<TvModel> tvShows;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
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
              const SizedBox(height: 20.0),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder:
                      (context, index) => SizedBox(
                        height: 180.0,
                        child: SeeAllTvShowsListItem(
                          tvModel: tvShows[index],
                          isWatchList: true,
                        ),
                      ),
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 10.0),
                  itemCount: tvShows.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
