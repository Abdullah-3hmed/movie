import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_divider.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_cubit.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_state.dart';
import 'package:movie/features/tv/presentation/screens/widgets/custom_tv_watch_List_Icon.dart';

class TvDetailsSection extends StatelessWidget {
  const TvDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsCubit, TvDetailsState>(
      buildWhen:
          (previous, current) =>
              previous.tvDetailsState != current.tvDetailsState,
      builder: (context, state) {
        switch (state.tvDetailsState) {
          case RequestStatus.success:
            return Column(
              children: [
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 32.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow),
                          const SizedBox(height: 5.0),
                          Text("${state.tvDetailsModel.voteAverage} / 10"),
                          const SizedBox(height: 5.0),
                          Text("${state.tvDetailsModel.voteCount}"),
                        ],
                      ),
                      CustomTvWatchListIcon(
                        tvModel: state.tvDetailsModel.toTvModel(),
                      ),
                    ],
                  ),
                ),
                const CustomDivider(),
                Text(
                  state.tvDetailsModel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8.0),
                Text(
                  state.tvDetailsModel.geners.join(", "),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          AppStrings.year,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(fontSize: 14.0),
                        ),
                        Text(
                          state.tvDetailsModel.year,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          AppStrings.country,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(fontSize: 14.0),
                        ),
                        Text(
                          state.tvDetailsModel.country,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          AppStrings.from,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(fontSize: 14.0),
                        ),
                        Text(
                          state.tvDetailsModel.network,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 32.0,
                  ),
                  child: Text(
                    state.tvDetailsModel.overview,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const CustomDivider(),
              ],
            );
          case RequestStatus.error:
            return SizedBox(
              height: 350.0,
              child: Center(child: Text(state.tvDetailsErrorMessage)),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
