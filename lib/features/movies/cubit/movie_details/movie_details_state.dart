import 'package:equatable/equatable.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/movies/data/movie_details_model.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/shared/data/cast_model.dart';
import 'package:movie/features/shared/data/review_model.dart';

class MovieDetailsState extends Equatable {
  final RequestStatus movieDetailsState;
  final String movieDetailsErrorMessage;
  final MovieDetailsModel movieDetails;
  final RequestStatus castState;
  final String castErrorMessage;
  final List<CastModel> cast;
  final List<MoviesModel> recommendedMovies;
  final List<MoviesModel> similarMovies;
  final String recommendedErrorMessage;
  final String similarErrorMessage;
  final RequestStatus recommendedState;
  final RequestStatus similarState;
  final RequestStatus reviewsState;
  final List<ReviewModel> reviews;
  final String reviewsErrorMessage;
  final RequestStatus allMovieDetailsState;
  final String allMovieDetailsErrorMessage;
  final RequestStatus trailerState;
  final String videoId;
  final String trailerErrorMessage;
  final bool isConnected;

  const MovieDetailsState({
    this.movieDetailsState = RequestStatus.loading,
    this.movieDetailsErrorMessage = '',
    this.movieDetails = MovieDetailsModel.empty,
    this.castState = RequestStatus.loading,
    this.castErrorMessage = '',
    this.cast = const [],
    this.recommendedState = RequestStatus.loading,
    this.similarState = RequestStatus.loading,
    this.recommendedErrorMessage = '',
    this.similarErrorMessage = '',
    this.recommendedMovies = const [],
    this.similarMovies = const [],
    this.reviewsState = RequestStatus.loading,
    this.reviews = const [],
    this.reviewsErrorMessage = '',
    this.allMovieDetailsState = RequestStatus.initial,
    this.allMovieDetailsErrorMessage = '',
    this.trailerState = RequestStatus.initial,
    this.videoId = '',
    this.trailerErrorMessage = '',
    this.isConnected = true,
  });

  MovieDetailsState copyWith({
    RequestStatus? movieDetailsState,
    String? movieDetailsErrorMessage,
    MovieDetailsModel? movieDetails,
    RequestStatus? castState,
    String? castErrorMessage,
    List<CastModel>? cast,
    List<MoviesModel>? recommendedMovies,
    List<MoviesModel>? similarMovies,
    String? recommendedErrorMessage,
    String? similarErrorMessage,
    RequestStatus? recommendedState,
    RequestStatus? similarState,
    RequestStatus? reviewsState,
    List<ReviewModel>? reviews,
    String? reviewsErrorMessage,
    RequestStatus? allMovieDetailsState,
    String? allMovieDetailsErrorMessage,
    RequestStatus? trailerState,
    String? videoId,
    String? trailerErrorMessage,
    bool? isConnected,
  }) {
    return MovieDetailsState(
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsErrorMessage:
          movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
      movieDetails: movieDetails ?? this.movieDetails,
      castState: castState ?? this.castState,
      castErrorMessage: castErrorMessage ?? this.castErrorMessage,
      cast: cast ?? this.cast,
      recommendedMovies: recommendedMovies ?? this.recommendedMovies,
      similarMovies: similarMovies ?? this.similarMovies,
      recommendedErrorMessage:
          recommendedErrorMessage ?? this.recommendedErrorMessage,
      similarErrorMessage: similarErrorMessage ?? this.similarErrorMessage,
      recommendedState: recommendedState ?? this.recommendedState,
      similarState: similarState ?? this.similarState,
      reviewsState: reviewsState ?? this.reviewsState,
      reviews: reviews ?? this.reviews,
      reviewsErrorMessage: reviewsErrorMessage ?? this.reviewsErrorMessage,
      allMovieDetailsState: allMovieDetailsState ?? this.allMovieDetailsState,
      allMovieDetailsErrorMessage:
          allMovieDetailsErrorMessage ?? this.allMovieDetailsErrorMessage,
      trailerState: trailerState ?? this.trailerState,
      videoId: videoId ?? this.videoId,
      trailerErrorMessage: trailerErrorMessage ?? this.trailerErrorMessage,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object> get props => [
    movieDetailsState,
    movieDetailsErrorMessage,
    movieDetails,
    castState,
    castErrorMessage,
    cast,
    recommendedMovies,
    similarMovies,
    recommendedErrorMessage,
    similarErrorMessage,
    recommendedState,
    similarState,
    reviewsState,
    reviews,
    reviewsErrorMessage,
    allMovieDetailsState,
    allMovieDetailsErrorMessage,
    trailerState,
    videoId,
    trailerErrorMessage,
    isConnected,
  ];
}
