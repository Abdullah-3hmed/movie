import 'package:equatable/equatable.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/movies/data/movie/movies_model.dart';
import 'package:movie/features/movies/data/movie/up_coming_movies_model.dart';

class MovieState extends Equatable {
  final RequestStatus nowPlayingMoviesState;
  final List<MoviesModel> nowPlayingMovies;
  final String nowPlayingErrorMessage;
  final RequestStatus upComingMoviesState;
  final List<UpComingMoviesModel> upComingMovies;
  final String upComingErrorMessage;
  final RequestStatus topRatedMoviesState;
  final List<MoviesModel> topRatedMovies;
  final String topRatedErrorMessage;
  final RequestStatus popularMoviesState;
  final List<MoviesModel> popularMovies;
  final String popularErrorMessage;
  final RequestStatus allMoviesState;
  final String allMoviesErrorMessage;
  final bool isConnected;

  const MovieState({
    this.nowPlayingMoviesState = RequestStatus.loading,
    this.nowPlayingMovies = const [],
    this.nowPlayingErrorMessage = '',
    this.upComingMoviesState = RequestStatus.loading,
    this.upComingMovies = const [],
    this.upComingErrorMessage = '',
    this.topRatedMoviesState = RequestStatus.loading,
    this.topRatedMovies = const [],
    this.topRatedErrorMessage = '',
    this.popularMoviesState = RequestStatus.loading,
    this.popularMovies = const [],
    this.popularErrorMessage = '',
    this.allMoviesState = RequestStatus.loading,
    this.allMoviesErrorMessage = '',
    this.isConnected = true,
  });

  MovieState copyWith({
    RequestStatus? nowPlayingMoviesState,
    List<MoviesModel>? nowPlayingMovies,
    String? nowPlayingErrorMessage,
    RequestStatus? upComingMoviesState,
    List<UpComingMoviesModel>? upComingMovies,
    String? upComingErrorMessage,
    RequestStatus? topRatedMoviesState,
    List<MoviesModel>? topRatedMovies,
    String? topRatedErrorMessage,
    RequestStatus? popularMoviesState,
    List<MoviesModel>? popularMovies,
    String? popularErrorMessage,
    RequestStatus? allMoviesState,
    String? allMoviesErrorMessage,
    bool? isConnected,
  }) {
    return MovieState(
      nowPlayingMoviesState:
          nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingErrorMessage:
          nowPlayingErrorMessage ?? this.nowPlayingErrorMessage,
      upComingMoviesState: upComingMoviesState ?? this.upComingMoviesState,
      upComingMovies: upComingMovies ?? this.upComingMovies,
      upComingErrorMessage: upComingErrorMessage ?? this.upComingErrorMessage,
      isConnected: isConnected ?? this.isConnected,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedErrorMessage: topRatedErrorMessage ?? this.topRatedErrorMessage,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMovies: popularMovies ?? this.popularMovies,
      popularErrorMessage: popularErrorMessage ?? this.popularErrorMessage,
      allMoviesErrorMessage:
          allMoviesErrorMessage ?? this.allMoviesErrorMessage,
      allMoviesState: allMoviesState ?? this.allMoviesState,
    );
  }

  @override
  List<Object> get props => [
    nowPlayingMoviesState,
    nowPlayingMovies,
    nowPlayingErrorMessage,
    upComingMoviesState,
    upComingMovies,
    upComingErrorMessage,
    topRatedMoviesState,
    topRatedMovies,
    topRatedErrorMessage,
    popularMoviesState,
    popularMovies,
    popularErrorMessage,
    allMoviesState,
    allMoviesErrorMessage,
    isConnected,
  ];
}
