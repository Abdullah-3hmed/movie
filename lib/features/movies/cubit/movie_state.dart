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

  final bool isConnected;

  const MovieState({
    this.nowPlayingMoviesState = RequestStatus.loading,
    this.nowPlayingMovies = const [],
    this.nowPlayingErrorMessage = '',
    this.upComingMoviesState = RequestStatus.loading,
    this.upComingMovies = const [],
    this.upComingErrorMessage = '',
    this.isConnected = true,
  });

  MovieState copyWith({
    RequestStatus? nowPlayingMoviesState,
    List<MoviesModel>? nowPlayingMovies,
    String? nowPlayingErrorMessage,
    RequestStatus? upComingMoviesState,
    List<UpComingMoviesModel>? upComingMovies,
    String? upComingErrorMessage,
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
    isConnected,
  ];
}
