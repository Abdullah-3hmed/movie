import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/media_type.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/features/profile/cubit/profile_cubit.dart';
import 'package:movie/features/profile/cubit/profile_state.dart';
import 'package:movie/features/tv/data/tv_model.dart';

class CustomTvWatchListIcon extends StatelessWidget {
  const CustomTvWatchListIcon({super.key, required this.tvModel});

  final TvModel tvModel;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileCubit, ProfileState, Set<int>>(
      selector: (state) {
        return state.inTvWatchlist;
      },
      builder: (context, inTvWatchlist) {
        return IconButton(
          onPressed: () async {
            await context.read<ProfileCubit>().addAndRemoveFromTvWatchList(
              tvId: tvModel.id,
              tvModel: tvModel,
            );
          },
          icon:
              inTvWatchlist.contains(tvModel.id)
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
