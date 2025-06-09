part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchMovieEvent extends SearchEvent {
  final String movieName;

  SearchMovieEvent({required this.movieName});

  @override
  List<Object> get props => [movieName];
}

class SearchTvShowsEvent extends SearchEvent {
  final String tvShowName;

  SearchTvShowsEvent({required this.tvShowName});

  @override
  List<Object> get props => [tvShowName];
}

class SearchActorEvent extends SearchEvent {
  final String actorName;

  SearchActorEvent({required this.actorName});

  @override
  List<Object> get props => [actorName];
}

class ChangeSearchTabEvent extends SearchEvent {
  final int index;
  ChangeSearchTabEvent({required this.index});
}
