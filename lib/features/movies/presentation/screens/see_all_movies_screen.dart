import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/shared/presentation/widgets/see_all_list_view_item.dart';

@RoutePage()
class SeeAllMoviesScreen extends StatelessWidget {
  const SeeAllMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 60.0),
            Row(
              children: [
                const CustomBackButton(),
                const SizedBox(width: 16.0),
                Text(
                  "See All Movies",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const SeeAllListViewItem(),
                separatorBuilder:
                    (context, index) => const SizedBox(height: 16.0),
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
