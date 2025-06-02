import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/season_list_item.dart';

@RoutePage()
class TvSeasonsScreen extends StatelessWidget {
  const TvSeasonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
            itemBuilder:
                (context, index) =>
                    const SizedBox(height: 160.0, child: SeasonListItem()),
            separatorBuilder: (context, index) => const SizedBox(height: 16.0),
            itemCount: 10,
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
