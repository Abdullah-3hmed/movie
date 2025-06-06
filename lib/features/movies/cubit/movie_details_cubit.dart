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
              movieDetailsStatus: RequestStatus.error,
              movieDetailsErrorMessage: failure.errorMessage,
              isConnected: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              movieDetailsStatus: RequestStatus.error,
              movieDetailsErrorMessage: failure.errorMessage,
              isConnected: true,
            ),
          );
        }
      },
      (movieDetails) => emit(
        state.copyWith(
          movieDetailsStatus: RequestStatus.success,
          movieDetails: movieDetails,
        ),
      ),
    );
  }
}
