import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/movies/cubit/movie/movie_state.dart';
import 'package:movie/features/movies/repos/movie/movie_repo.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({required this.movieRepo}) : super(const MovieState());
  final MovieRepo movieRepo;

  Future<void> getUpComingMovies() async {
    final result = await movieRepo.getUpComingMovies();
    result.fold(
      (failure) {
        if (!failure.isConnected) {
          emit(
            state.copyWith(
              upComingMoviesState: RequestStatus.error,
              upComingErrorMessage: failure.errorMessage,
              isConnected: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              upComingMoviesState: RequestStatus.error,
              upComingErrorMessage: failure.errorMessage,
            ),
          );
        }
      },
      (movies) => emit(
        state.copyWith(
          upComingMoviesState: RequestStatus.success,
          upComingMovies: movies,
        ),
      ),
    );
  }

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

  Future<void> getTopRatedMovies() async {
    final result = await movieRepo.getTopRatedMovies();
    result.fold(
      (failure) => emit(
        state.copyWith(
          topRatedMoviesState: RequestStatus.error,
          topRatedErrorMessage: failure.errorMessage,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          topRatedMoviesState: RequestStatus.success,
          topRatedMovies: movies,
        ),
      ),
    );
  }

  Future<void> getPopularMovies() async {
    final result = await movieRepo.getPopularMovies();
    result.fold(
      (failure) => emit(
        state.copyWith(
          popularMoviesState: RequestStatus.error,
          popularErrorMessage: failure.errorMessage,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          popularMoviesState: RequestStatus.success,
          popularMovies: movies,
        ),
      ),
    );
  }

  Future<void> getAllHomeMovies() async {
    emit(
      state.copyWith(allMoviesState: RequestStatus.loading, isConnected: true),
    );
    await Future.wait([
      getUpComingMovies(),
      getNowPlayingMovies(),
      getTopRatedMovies(),
      getPopularMovies(),
    ]);
    if (!state.isConnected) {
      emit(
        state.copyWith(
          allMoviesState: RequestStatus.error,
          allMoviesErrorMessage: state.upComingErrorMessage,
        ),
      );
    } else {
      emit(state.copyWith(allMoviesState: RequestStatus.success));
    }
  }
}
