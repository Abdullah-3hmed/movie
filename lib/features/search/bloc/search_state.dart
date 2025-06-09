import 'package:equatable/equatable.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/tv/data/tv_model.dart';

class SearchState extends Equatable {
  final RequestStatus moviesRequestState;
  final RequestStatus tvRequestState;
  final RequestStatus actorRequestStatus;
  final List<MoviesModel> movies;
  final List<TvModel> tvShows;
  final String tvErrorMessage;
  final String moviesErrorMessage;
  final int currentTabIndex;
  final bool isConnected;

  const SearchState({
    this.moviesRequestState = RequestStatus.initial,
    this.tvRequestState = RequestStatus.initial,
    this.actorRequestStatus = RequestStatus.initial,
    this.movies = const [],
    this.moviesErrorMessage = '',
    this.tvShows = const [],
    this.tvErrorMessage = '',
    this.currentTabIndex = 0,
    this.isConnected = true,
  });

  SearchState copyWith({
    RequestStatus? moviesRequestState,
    RequestStatus? tvRequestState,
    RequestStatus? actorRequestStatus,
    List<MoviesModel>? movies,
    String? moviesErrorMessage,
    List<TvModel>? tvShows,
    String? tvErrorMessage,
    int? currentTabIndex,
    bool? isConnected,
  }) {
    return SearchState(
      moviesRequestState: moviesRequestState ?? this.moviesRequestState,
      tvRequestState: tvRequestState ?? this.tvRequestState,
      actorRequestStatus: actorRequestStatus ?? this.actorRequestStatus,
      movies: movies ?? this.movies,
      moviesErrorMessage: moviesErrorMessage ?? this.moviesErrorMessage,
      tvShows: tvShows ?? this.tvShows,
      tvErrorMessage: tvErrorMessage ?? this.tvErrorMessage,
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object> get props => [
    moviesRequestState,
    tvRequestState,
    actorRequestStatus,
    movies,
    moviesErrorMessage,
    tvShows,
    tvErrorMessage,
    currentTabIndex,
    isConnected,
  ];
}
