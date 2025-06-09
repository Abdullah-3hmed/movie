import 'package:equatable/equatable.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/search/data/search_actor_model.dart';
import 'package:movie/features/tv/data/tv_model.dart';

class SearchState extends Equatable {
  final RequestStatus moviesRequestState;
  final RequestStatus tvRequestState;
  final RequestStatus actorRequestState;
  final List<MoviesModel> movies;
  final List<TvModel> tvShows;
  final List<SearchActorModel> actors;
  final String actorErrorMessage;
  final String tvErrorMessage;
  final String moviesErrorMessage;
  final int currentTabIndex;
  final bool isConnected;

  const SearchState({
    this.moviesRequestState = RequestStatus.initial,
    this.tvRequestState = RequestStatus.initial,
    this.actorRequestState = RequestStatus.initial,
    this.movies = const [],
    this.moviesErrorMessage = '',
    this.tvShows = const [],
    this.tvErrorMessage = '',
    this.currentTabIndex = 0,
    this.actors = const [],
    this.actorErrorMessage = '',
    this.isConnected = true,
  });

  SearchState copyWith({
    RequestStatus? moviesRequestState,
    RequestStatus? tvRequestState,
    RequestStatus? actorRequestState,
    List<MoviesModel>? movies,
    String? moviesErrorMessage,
    List<TvModel>? tvShows,
    String? tvErrorMessage,
    int? currentTabIndex,
    List<SearchActorModel>? actors,
    String? actorErrorMessage,
    bool? isConnected,
  }) {
    return SearchState(
      moviesRequestState: moviesRequestState ?? this.moviesRequestState,
      tvRequestState: tvRequestState ?? this.tvRequestState,
      actorRequestState: actorRequestState ?? this.actorRequestState,
      movies: movies ?? this.movies,
      moviesErrorMessage: moviesErrorMessage ?? this.moviesErrorMessage,
      tvShows: tvShows ?? this.tvShows,
      tvErrorMessage: tvErrorMessage ?? this.tvErrorMessage,
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      isConnected: isConnected ?? this.isConnected,
      actors: actors ?? this.actors,
      actorErrorMessage: actorErrorMessage ?? this.actorErrorMessage,
    );
  }

  @override
  List<Object> get props => [
    moviesRequestState,
    tvRequestState,
    actorRequestState,
    movies,
    moviesErrorMessage,
    tvShows,
    tvErrorMessage,
    currentTabIndex,
    actors,
    actorErrorMessage,
    isConnected,
  ];
}
