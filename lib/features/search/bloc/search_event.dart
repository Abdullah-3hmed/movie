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
