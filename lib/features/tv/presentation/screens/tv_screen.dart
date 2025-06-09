import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/core/widgets/no_internet_widget.dart';
import 'package:movie/features/shared/presentation/screens/widgets/custom_loading.dart';
import 'package:movie/features/tv/cubit/tv_cubit/tv_cubit.dart';
import 'package:movie/features/tv/cubit/tv_cubit/tv_state.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_show/poplar_tv_show_section.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_show/top_rated_tv_show_section.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_show/tv_airing_today_section.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_show/tv_on_the_air_section.dart';

@RoutePage()
class TvScreen extends StatelessWidget {
  const TvScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: BlocBuilder<TvCubit, TvState>(
        buildWhen:
            (previous, current) => previous.allTvState != current.allTvState,
        builder: (context, state) {
          switch (state.allTvState) {
            case RequestStatus.loading:
              return const CustomLoading();
            case RequestStatus.success:
              return const CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: TvOnTheAirSection()),
                  SliverToBoxAdapter(child: TvAiringTodaySection()),
                  SliverToBoxAdapter(child: TopRatedTvShowSection()),
                  SliverToBoxAdapter(child: PoplarTvShowSection()),
                ],
              );
            case RequestStatus.error:
              return NoInternetWidget(
                errorMessage: state.allTvErrorMessage,
                onPressed:
                    () async => await context.read<TvCubit>().getAllTvShows(),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
