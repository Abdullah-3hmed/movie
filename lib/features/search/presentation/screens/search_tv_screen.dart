import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/widgets/no_internet_widget.dart';
import 'package:movie/features/search/bloc/search_bloc.dart';
import 'package:movie/features/search/bloc/search_state.dart';
import 'package:movie/features/search/presentation/screens/widgets/search_no_results_found.dart';
import 'package:movie/features/search/presentation/screens/widgets/search_screen_initial_widget.dart';
import 'package:movie/features/search/presentation/screens/widgets/tv_search_list_view_item.dart';
import 'package:movie/features/shared/presentation/screens/widgets/custom_loading.dart';

@RoutePage()
class SearchTvScreen extends StatelessWidget {
  const SearchTvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen:
          (previous, current) =>
              previous.tvRequestState != current.tvRequestState,
      builder: (context, state) {
        switch (state.tvRequestState) {
          case RequestStatus.initial:
            return const SearchScreenInitialWidget();
          case RequestStatus.loading:
            return const CustomLoading();
          case RequestStatus.success:
            return state.tvShows.isEmpty
                ? const SearchNoResultsFound()
                : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  cacheExtent: 200.0,
                  itemBuilder:
                      (context, index) => SizedBox(
                        height: 180.0,
                        child: TvSearchListViewItem(
                          tvModel: state.tvShows[index],
                        ),
                      ),
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 16.0),
                  itemCount: state.tvShows.length,
                );
          case RequestStatus.error:
            if (!state.isConnected) {
              return NoInternetWidget(errorMessage: state.moviesErrorMessage);
            } else {
              return Center(
                child: Text(
                  state.moviesErrorMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }
        }
      },
    );
  }
}
