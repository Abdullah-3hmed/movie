import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/shared/presentation/widgets/actor_details_section.dart';
import 'package:movie/features/shared/presentation/widgets/tv_show_section.dart';

@RoutePage()
class TvActorDetailsScreen extends StatelessWidget {
  const TvActorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: ActorDetailsSection()),
          SliverToBoxAdapter(child: TvShowSection()),
        ],
      ),
    );
  }
}
