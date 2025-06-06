import 'package:equatable/equatable.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/movies/data/movie_details/movie_details_model.dart';

class MovieDetailsState extends Equatable {
  final RequestStatus movieDetailsStatus;
  final String movieDetailsErrorMessage;
  final MovieDetailsModel movieDetails;
  final bool isConnected;
  const MovieDetailsState({
    this.movieDetailsStatus = RequestStatus.loading,
    this.movieDetailsErrorMessage = '',
    this.movieDetails = MovieDetailsModel.empty,
    this.isConnected = true,
  });
  MovieDetailsState copyWith({
    RequestStatus? movieDetailsStatus,
    String? movieDetailsErrorMessage,
    MovieDetailsModel? movieDetails,
    bool? isConnected,
  }) {
    return MovieDetailsState(
      movieDetailsStatus: movieDetailsStatus ?? this.movieDetailsStatus,
      movieDetailsErrorMessage:
          movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
      movieDetails: movieDetails ?? this.movieDetails,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object> get props => [
    movieDetailsStatus,
    movieDetailsErrorMessage,
    movieDetails,
    isConnected,
  ];
}
