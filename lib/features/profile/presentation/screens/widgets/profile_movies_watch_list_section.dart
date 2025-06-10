import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/movie_list_view_item.dart';
import 'package:movie/features/profile/cubit/profile_cubit.dart';
import 'package:movie/features/profile/cubit/profile_state.dart';

class ProfileMoviesWatchListSection extends StatelessWidget {
  const ProfileMoviesWatchListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionTitle(
          title: AppStrings.moviesWatchList,
          onPressed: () {
            context.pushRoute(const WatchListRoute());
          },
        ),
        BlocBuilder<ProfileCubit, ProfileState>(
          buildWhen:
              (previous, current) =>
                  previous.moviesWatchlistState !=
                      current.moviesWatchlistState ||
                  previous.moviesWatchlist != current.moviesWatchlist,
          builder: (context, state) {
            switch (state.profileState) {
              case RequestStatus.success:
                return state.moviesWatchlist.isEmpty
                    ? const SizedBox(height: 250.0)
                    : SizedBox(
                      height: 250.0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: AppConstants.horizontalPadding,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder:
                            (context, index) => SizedBox(
                              height: 250.0,
                              child: MovieListViewItem(
                                moviesModel: state.moviesWatchlist[index],
                              ),
                            ),
                        separatorBuilder:
                            (context, index) => const SizedBox(width: 10.0),
                        itemCount: state.moviesWatchlist.length,
                      ),
                    );
              case RequestStatus.error:
                return SizedBox(
                  height: 250.0,
                  child: Center(
                    child: Text(
                      state.moviesWatchlistErrorMessage,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
