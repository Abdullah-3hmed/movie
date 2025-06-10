import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/widgets/no_internet_widget.dart';
import 'package:movie/features/search/bloc/search_bloc.dart';
import 'package:movie/features/search/bloc/search_state.dart';
import 'package:movie/features/search/presentation/screens/widgets/search_actors_list_item.dart';
import 'package:movie/features/search/presentation/screens/widgets/search_no_results_found.dart';
import 'package:movie/features/search/presentation/screens/widgets/search_screen_initial_widget.dart';
import 'package:movie/features/shared/presentation/screens/widgets/custom_loading.dart';

@RoutePage()
class SearchActorsScreen extends StatelessWidget {
  const SearchActorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen:
          (previous, current) =>
              previous.actorRequestState != current.actorRequestState,
      builder: (context, state) {
        switch (state.actorRequestState) {
          case RequestStatus.initial:
            return const SearchScreenInitialWidget();
          case RequestStatus.loading:
            return const CustomLoading();
          case RequestStatus.success:
            return state.actors.isEmpty
                ? const SearchNoResultsFound()
                : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  cacheExtent: 200.0,
                  itemBuilder:
                      (context, index) => SizedBox(
                        height: 180.0,
                        child: SearchActorsListItem(
                          searchActorModel: state.actors[index],
                        ),
                      ),
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 16.0),
                  itemCount: state.actors.length,
                );
          case RequestStatus.error:
            if (!state.isConnected) {
              return NoInternetWidget(errorMessage: state.actorErrorMessage);
            } else {
              return Text(
                state.actorErrorMessage,
                style: Theme.of(context).textTheme.bodyMedium,
              );
            }
        }
      },
    );
  }
}
