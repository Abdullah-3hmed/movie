import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_cubit.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_state.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/season_list_item.dart';

@RoutePage()
class TvSeasonsScreen extends StatelessWidget {
  const TvSeasonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsCubit, TvDetailsState>(
      buildWhen:
          (previous, current) =>
              previous.tvDetailsState != current.tvDetailsState,
      builder: (context, state) {
        switch (state.tvDetailsState) {
          case RequestStatus.loading:
            return const SizedBox.shrink();
          case RequestStatus.success:
            return Column(
              children: [
                const SizedBox(height: 20.0),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 24.0,
                    ),
                    itemBuilder:
                        (context, index) => SizedBox(
                          height: 160.0,
                          child: SeasonListItem(
                            seasonModel: state.tvDetailsModel.seasons[index],
                          ),
                        ),
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 16.0),
                    itemCount: state.tvDetailsModel.seasons.length,
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            );
          case RequestStatus.error:
            return Center(
              child: Text(
                state.tvDetailsErrorMessage,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
