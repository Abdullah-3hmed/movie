import 'package:equatable/equatable.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/movies/data/movie/now_playing_model.dart';

class MovieState extends Equatable {
  final RequestStatus nowPlayingMoviesState;
  final List<MovieNowPlayingModel> nowPlayingMovies;
  final String nowPlayingErrorMessage;
  final bool isConnected;

  const MovieState({
    this.nowPlayingMoviesState = RequestStatus.loading,
    this.nowPlayingMovies = const [],
    this.nowPlayingErrorMessage = '',
    this.isConnected = true,
  });

  MovieState copyWith({
    RequestStatus? nowPlayingMoviesState,
    List<MovieNowPlayingModel>? nowPlayingMovies,
    String? nowPlayingErrorMessage,
    bool? isConnected,
  }) {
    return MovieState(
      nowPlayingMoviesState:
          nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingErrorMessage:
          nowPlayingErrorMessage ?? this.nowPlayingErrorMessage,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object> get props => [
    nowPlayingMoviesState,
    nowPlayingMovies,
    nowPlayingErrorMessage,
  ];
}
