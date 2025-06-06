import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/movies/cubit/movie_details_state.dart';
import 'package:movie/features/movies/repos/movie_details_repo.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit({required this.movieDetailsRepo})
    : super(const MovieDetailsState());
  final MovieDetailsRepo movieDetailsRepo;

  Future<void> getMovieDetails({required int movieId}) async {
    final result = await movieDetailsRepo.getMovieDetails(movieId: movieId);
    result.fold(
      (failure) {
        if (!failure.isConnected) {
          emit(
            state.copyWith(
              movieDetailsState: RequestStatus.error,
              movieDetailsErrorMessage: failure.errorMessage,
              isConnected: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              movieDetailsState: RequestStatus.error,
              movieDetailsErrorMessage: failure.errorMessage,
              isConnected: true,
            ),
          );
        }
      },
      (movieDetails) => emit(
        state.copyWith(
          movieDetailsState: RequestStatus.success,
          movieDetails: movieDetails,
        ),
      ),
    );
  }

  Future<void> getMovieCast({required int movieId}) async {
    final result = await movieDetailsRepo.getMovieCast(movieId: movieId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          castState: RequestStatus.error,
          castErrorMessage: failure.errorMessage,
        ),
      ),
      (movieCast) => emit(
        state.copyWith(castState: RequestStatus.success, cast: movieCast),
      ),
    );
  }

  Future<void> getRecommendedMovies({required int movieId}) async {
    final result = await movieDetailsRepo.getRecommendedMovies(
      movieId: movieId,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          recommendedState: RequestStatus.error,
          recommendedErrorMessage: failure.errorMessage,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          recommendedState: RequestStatus.success,
          recommendedMovies: movies,
        ),
      ),
    );
  }

  Future<void> getSimilarMovies({required int movieId}) async {
    final result = await movieDetailsRepo.getSimilarMovies(movieId: movieId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          similarState: RequestStatus.error,
          similarErrorMessage: failure.errorMessage,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          similarState: RequestStatus.success,
          similarMovies: movies,
        ),
      ),
    );
  }

  Future<void> getReviews({required int movieId}) async {
    final result = await movieDetailsRepo.getMovieReviews(movieId: movieId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          reviewsState: RequestStatus.error,
          reviewsErrorMessage: failure.errorMessage,
        ),
      ),
      (reviews) => emit(
        state.copyWith(reviewsState: RequestStatus.success, reviews: reviews),
      ),
    );
  }
}
