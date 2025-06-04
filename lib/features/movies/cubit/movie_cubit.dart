import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/movies/cubit/movie_state.dart';
import 'package:movie/features/movies/repos/movie_repo.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({required this.movieRepo}) : super(const MovieState());
  final MovieRepo movieRepo;

  Future<void> getNowPlayingMovies() async {
    final result = await movieRepo.getNowPlayingMovies();
    result.fold(
      (failure) => emit(
        state.copyWith(
          nowPlayingMoviesState: RequestStatus.error,
          nowPlayingErrorMessage: failure.errorMessage,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          nowPlayingMoviesState: RequestStatus.success,
          nowPlayingMovies: movies,
        ),
      ),
    );
  }
}
