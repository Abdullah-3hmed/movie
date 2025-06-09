import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/widgets/no_internet_widget.dart';
import 'package:movie/features/search/bloc/search_bloc.dart';
import 'package:movie/features/search/bloc/search_state.dart';
import 'package:movie/features/search/presentation/screens/widgets/movie_search_list_item.dart';
import 'package:movie/features/shared/presentation/screens/widgets/custom_loading.dart';

@RoutePage()
class SearchMoviesScreen extends StatelessWidget {
  const SearchMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen:
          (previous, current) =>
              previous.moviesRequestState != current.moviesRequestState,
      builder: (context, state) {
        switch (state.moviesRequestState) {
          case RequestStatus.loading:
            return const CustomLoading();
          case RequestStatus.success:
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              cacheExtent: 200.0,
              itemBuilder:
                  (context, index) => SizedBox(
                    height: 180.0,
                    child: MovieSearchListItem(
                      movieModel: state.movies[index],
                    ), // SeeAllAndSearchListViewItem(),
                  ),
              separatorBuilder:
                  (context, index) => const SizedBox(height: 16.0),
              itemCount: state.movies.length,
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
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
