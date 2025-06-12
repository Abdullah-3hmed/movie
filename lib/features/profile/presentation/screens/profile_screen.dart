import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/core/widgets/no_internet_widget.dart';
import 'package:movie/features/profile/cubit/profile_cubit.dart';
import 'package:movie/features/profile/cubit/profile_state.dart';
import 'package:movie/features/profile/presentation/screens/widgets/profile_header_section.dart';
import 'package:movie/features/profile/presentation/screens/widgets/profile_movies_watch_list_section.dart';
import 'package:movie/features/profile/presentation/screens/widgets/profile_tv_shows_watch_list.dart';
import 'package:movie/features/shared/presentation/screens/widgets/custom_loading.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          buildWhen:
              (previous, current) =>
                  previous.profileAndWatchlistState !=
                  current.profileAndWatchlistState,
          builder: (context, state) {
            switch (state.profileAndWatchlistState) {
              case RequestStatus.loading:
                return const CustomLoading();
              case RequestStatus.success:
                return const CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(child: ProfileHeaderSection()),
                    SliverToBoxAdapter(child: ProfileMoviesWatchListSection()),
                    SliverToBoxAdapter(child: ProfileTvShowsWatchList()),
                  ],
                );
              case RequestStatus.error:
                return NoInternetWidget(
                  errorMessage: state.profileAndWatchlistErrorMessage,
                  onPressed: () async {
                    await context
                        .read<ProfileCubit>()
                        .getProfileAndWatchLists();
                  },
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
