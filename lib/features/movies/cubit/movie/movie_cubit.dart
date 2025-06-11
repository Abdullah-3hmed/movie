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

  Future<void> getNowPlayingMovies({required int page}) async {
    final result = await movieRepo.getNowPlayingMovies(page: page);
    result.fold(
      (failure) => emit(
        state.copyWith(
          nowPlayingMoviesState: RequestStatus.error,
          nowPlayingErrorMessage: failure.errorMessage,
        ),
      ),
      (movies) {
        emit(
          state.copyWith(
            nowPlayingMoviesState: RequestStatus.success,
            nowPlayingMovies: [...state.nowPlayingMovies, ...movies],
            nowPlayingPage: state.nowPlayingPage + 1,
          ),
        );
      },
    );
  }

  Future<void> getTopRatedMovies({required int page}) async {
    final result = await movieRepo.getTopRatedMovies(page: page);
    result.fold(
      (failure) => emit(
        state.copyWith(
          topRatedMoviesState: RequestStatus.error,
          topRatedErrorMessage: failure.errorMessage,
        ),
      ),
      (movies) {
        emit(
          state.copyWith(
            topRatedMoviesState: RequestStatus.success,
            topRatedMovies: [...state.topRatedMovies, ...movies],
            topRatedPage: state.topRatedPage + 1,
          ),
        );
      },
    );
  }

  Future<void> getPopularMovies({required int page}) async {
    final result = await movieRepo.getPopularMovies(page: page);
    result.fold(
      (failure) => emit(
        state.copyWith(
          popularMoviesState: RequestStatus.error,
          popularErrorMessage: failure.errorMessage,
        ),
      ),
      (movies) {
        emit(
          state.copyWith(
            popularMoviesState: RequestStatus.success,
            popularMovies: [...state.popularMovies, ...movies],
            popularPage: state.popularPage + 1,
          ),
        );
      },
    );
  }

  Future<void> getAllHomeMovies() async {
    emit(
      state.copyWith(allMoviesState: RequestStatus.loading, isConnected: true),
    );
    await Future.wait([
      getUpComingMovies(),
      getNowPlayingMovies(page: 1),
      getTopRatedMovies(page: 1),
      getPopularMovies(page: 1),
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

  Future<void> loadMoreNowPlayingMovies() async {
    emit(state.copyWith(nowPlayingMoviesState: RequestStatus.loading));
    await getNowPlayingMovies(page: state.nowPlayingPage + 1);
  }

  Future<void> loadMoreTopRatedMovies() async {
    emit(state.copyWith(topRatedMoviesState: RequestStatus.loading));
    await getTopRatedMovies(page: state.topRatedPage + 1);
  }

  Future<void> loadMorePopularMovies() async {
    emit(state.copyWith(popularMoviesState: RequestStatus.loading));
    await getPopularMovies(page: state.popularPage + 1);
  }
}
