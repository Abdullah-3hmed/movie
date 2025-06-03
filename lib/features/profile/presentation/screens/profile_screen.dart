import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_divider.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/profile/presentation/screens/widgets/profile_header_section.dart';
import 'package:movie/features/profile/presentation/screens/widgets/profile_movies_watch_list_section.dart';
import 'package:movie/features/profile/presentation/screens/widgets/profile_tv_shows_watch_list.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 40.0),
              ProfileHeaderSection(),
              ProfileMoviesWatchListSection(),
              CustomDivider(),
              ProfileTvShowsWatchList(),
            ],
          ),
        ),
      ),
    );
  }
}
