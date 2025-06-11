import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/core/widgets/no_internet_widget.dart';
import 'package:movie/features/movies/cubit/actor/actor_cubit.dart';
import 'package:movie/features/movies/cubit/actor/actor_state.dart';
import 'package:movie/features/shared/presentation/screens/widgets/actor_details_section.dart';
import 'package:movie/features/shared/presentation/screens/widgets/custom_loading.dart';
import 'package:movie/features/shared/presentation/screens/widgets/tv_show_section.dart';

@RoutePage()
class ActorDetailsScreen extends StatelessWidget implements AutoRouteWrapper {
  const ActorDetailsScreen({super.key, required this.actorId});

  final int actorId;

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
    create:
        (context) =>
            getIt<ActorCubit>()..getActorDetailsAndMovies(actorId: actorId),
    child: this,
  );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: BlocBuilder<ActorCubit, ActorState>(
        buildWhen:
            (previous, current) =>
                previous.actorDetailsState != current.actorDetailsState,
        builder: (context, state) {
          switch (state.actorDetailsState) {
            case RequestStatus.loading:
              return const CustomLoading();
            case RequestStatus.success:
              return const CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: ActorDetailsSection()),
                  SliverToBoxAdapter(child: TvShowSection()),
                ],
              );
            case RequestStatus.error:
              return NoInternetWidget(
                errorMessage: state.actorDetailsErrorMessage,
                onPressed:
                    () async => await getIt<ActorCubit>()
                        .getActorDetailsAndMovies(actorId: actorId),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
