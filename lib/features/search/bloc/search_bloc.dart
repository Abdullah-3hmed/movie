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
    on<SearchTvShowsEvent>(
      _searchTvShowsEvent,
      transformer: debounceRestartable(const Duration(milliseconds: 500)),
    );
    on<ChangeSearchTabEvent>((event, emit) {
      emit(state.copyWith(currentTabIndex: event.index));
    });
    on<SearchActorEvent>(
      _searchActorEvent,
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
    emit(
      state.copyWith(
        moviesRequestState: RequestStatus.loading,
        isConnected: true,
      ),
    );

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

  FutureOr<void> _searchTvShowsEvent(
    SearchTvShowsEvent event,
    Emitter<SearchState> emit,
  ) async {
    final trimmedQuery = event.tvShowName.trim();
    if (trimmedQuery.isEmpty) {
      emit(state.copyWith(tvShows: [], tvRequestState: RequestStatus.initial));
      return;
    }
    emit(
      state.copyWith(tvRequestState: RequestStatus.loading, isConnected: true),
    );

    final result = await searchRepo.searchTvShows(tvShowName: trimmedQuery);

    result.fold(
      (failure) {
        if (!failure.isConnected) {
          emit(
            state.copyWith(
              tvRequestState: RequestStatus.error,
              tvErrorMessage: failure.errorMessage,
              isConnected: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              tvRequestState: RequestStatus.error,
              tvErrorMessage: failure.errorMessage,
            ),
          );
        }
      },
      (tvShows) => emit(
        state.copyWith(tvRequestState: RequestStatus.success, tvShows: tvShows),
      ),
    );
  }

  FutureOr<void> _searchActorEvent(
    SearchActorEvent event,
    Emitter<SearchState> emit,
  ) async {
    final trimmedQuery = event.actorName.trim();
    if (trimmedQuery.isEmpty) {
      emit(
        state.copyWith(actors: [], actorRequestState: RequestStatus.initial),
      );
      return;
    }
    emit(
      state.copyWith(
        actorRequestState: RequestStatus.loading,
        isConnected: true,
      ),
    );

    final result = await searchRepo.searchActors(actorName: trimmedQuery);

    result.fold(
      (failure) {
        if (!failure.isConnected) {
          emit(
            state.copyWith(
              actorRequestState: RequestStatus.error,
              actorErrorMessage: failure.errorMessage,
              isConnected: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              actorRequestState: RequestStatus.error,
              actorErrorMessage: failure.errorMessage,
            ),
          );
        }
      },
      (actors) => emit(
        state.copyWith(
          actorRequestState: RequestStatus.success,
          actors: actors,
        ),
      ),
    );
  }

  EventTransformer<T> debounceRestartable<T>(Duration duration) {
    return (events, mapper) =>
        restartable<T>().call(events.debounceTime(duration), mapper);
  }
}
