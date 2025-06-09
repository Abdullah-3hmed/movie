import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/search/bloc/search_state.dart';
import 'package:movie/features/search/repos/search_repo.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepo searchRepo;

  SearchBloc({required this.searchRepo}) : super(const SearchState()) {
    on<SearchMovieEvent>(
      _searchMovieEvent,
      transformer: debounceRestartable(const Duration(milliseconds: 500)),
    );
  }

  FutureOr<void> _searchMovieEvent(
    SearchMovieEvent event,
    Emitter<SearchState> emit,
  ) async {
    final trimmedQuery = event.movieName.trim();

    if (trimmedQuery.isEmpty) {
      emit(
        state.copyWith(movies: [], moviesRequestState: RequestStatus.initial),
      );
      return;
    }
    //
    emit(state.copyWith(moviesRequestState: RequestStatus.loading));

    final result = await searchRepo.searchMovies(movieName: trimmedQuery);

    result.fold(
      (failure) {
        if (!failure.isConnected) {
          emit(
            state.copyWith(
              moviesRequestState: RequestStatus.error,
              moviesErrorMessage: failure.errorMessage,
              isConnected: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              moviesRequestState: RequestStatus.error,
              moviesErrorMessage: failure.errorMessage,
            ),
          );
        }
      },
      (movies) => emit(
        state.copyWith(
          moviesRequestState: RequestStatus.success,
          movies: movies,
        ),
      ),
    );
  }

  EventTransformer<T> debounceRestartable<T>(Duration duration) {
    return (events, mapper) =>
        restartable<T>().call(events.debounceTime(duration), mapper);
  }
}
