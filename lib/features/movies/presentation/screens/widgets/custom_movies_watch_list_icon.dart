import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/media_type.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/profile/cubit/profile_cubit.dart';
import 'package:movie/features/profile/cubit/profile_state.dart';

class CustomMoviesWatchListIcon extends StatelessWidget {
  const CustomMoviesWatchListIcon({super.key, required this.moviesModel});

  final MoviesModel moviesModel;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileCubit, ProfileState, Set<int>>(
      selector: (state) {
        return state.inMoviesWatchlist;
      },
      builder: (context, inMoviesWatchlist) {
        return IconButton(
          onPressed: () async {
            await context.read<ProfileCubit>().addAndRemoveFromWatchList(
              mediaType: MediaType.movie,
              mediaId: moviesModel.id,
              moviesModel: moviesModel,
            );
          },
          icon:
              inMoviesWatchlist.contains(moviesModel.id)
                  ? const Icon(
                    SolarSystemIcons.saved,
                    color: ColorsManager.darkPrimary,
                  )
                  : const Icon(
                    SolarSystemIcons.unsaved,
                    color: ColorsManager.darkPrimary,
                  ),
        );
      },
    );
  }
}
