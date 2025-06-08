import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/tv/cubit/tv_state.dart';
import 'package:movie/features/tv/repos/tv_repo.dart';

class TvCubit extends Cubit<TvState> {
  TvCubit({required this.tvRepo}) : super(const TvState());
  final TvRepo tvRepo;

  Future<void> getOnTheAirMovies() async {
    final result = await tvRepo.getOnTheAirShows();
    result.fold(
      (failure) {
        if (!failure.isConnected) {
          emit(
            state.copyWith(
              tvOnTheAirState: RequestStatus.error,
              tvOnTheAirErrorMessage: failure.errorMessage,
              isConnected: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              tvOnTheAirState: RequestStatus.error,
              tvOnTheAirErrorMessage: failure.errorMessage,
            ),
          );
        }
      },
      (movies) => emit(
        state.copyWith(
          tvOnTheAirState: RequestStatus.success,
          tvOnTheAirShows: movies,
        ),
      ),
    );
  }

  Future<void> getAiringTodayMovies() async {
    final result = await tvRepo.getAiringTodayShows();
    result.fold(
      (failure) => emit(
        state.copyWith(
          tvAiringTodayState: RequestStatus.error,
          tvAiringTodayErrorMessage: failure.errorMessage,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          tvAiringTodayState: RequestStatus.success,
          tvAiringTodayShows: movies,
        ),
      ),
    );
  }

  Future<void> getPopularMovies() async {
    final result = await tvRepo.getPopularTvShows();
    result.fold(
      (failure) => emit(
        state.copyWith(
          tvPopularState: RequestStatus.error,
          tvPopularErrorMessage: failure.errorMessage,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          tvPopularState: RequestStatus.success,
          tvPopularShows: movies,
        ),
      ),
    );
  }

  Future<void> getTopRatedMovies() async {
    final result = await tvRepo.getTopRatedTvShows();
    result.fold(
      (failure) => emit(
        state.copyWith(
          tvTopRatedState: RequestStatus.error,
          tvTopRatedErrorMessage: failure.errorMessage,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          tvTopRatedState: RequestStatus.success,
          tvTopRatedShows: movies,
        ),
      ),
    );
  }

  Future<void> getAllTvShows() async {
    emit(state.copyWith(allTvState: RequestStatus.loading, isConnected: true));
    await Future.wait([
      getOnTheAirMovies(),
      getAiringTodayMovies(),
      getPopularMovies(),
      getTopRatedMovies(),
    ]);
    if (!state.isConnected) {
      emit(
        state.copyWith(
          allTvState: RequestStatus.error,
          allTvErrorMessage: state.tvOnTheAirErrorMessage,
        ),
      );
    } else {
      emit(state.copyWith(allTvState: RequestStatus.success));
    }
  }
}
