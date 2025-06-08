import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_state.dart';
import 'package:movie/features/tv/repos/tv_details_repo/tv_details_repo.dart';

class TvDetailsCubit extends Cubit<TvDetailsState> {
  TvDetailsCubit({required this.tvDetailsRepo}) : super(const TvDetailsState());
  final TvDetailsRepo tvDetailsRepo;

  Future<void> getTvDetails({required int tvId}) async {
    emit(state.copyWith(tvDetailsState: RequestStatus.loading));
    final result = await tvDetailsRepo.getTvDetails(tvId: tvId);
    result.fold(
      (failure) {
        if (!failure.isConnected) {
          emit(
            state.copyWith(
              tvDetailsState: RequestStatus.error,
              tvDetailsErrorMessage: failure.errorMessage,
              isConnected: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              tvDetailsState: RequestStatus.error,
              tvDetailsErrorMessage: failure.errorMessage,
            ),
          );
        }
      },
      (tvDetailsModel) => emit(
        state.copyWith(
          tvDetailsState: RequestStatus.success,
          tvDetailsModel: tvDetailsModel,
        ),
      ),
    );
  }

  Future<void> getTvCast({required int tvId}) async {
    final result = await tvDetailsRepo.getTvCast(tvId: tvId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          tvCastState: RequestStatus.error,
          tvCastErrorMessage: failure.errorMessage,
        ),
      ),
      (tvCast) => emit(
        state.copyWith(tvCastState: RequestStatus.success, tvCast: tvCast),
      ),
    );
  }

  Future<void> getTvRecommendations({required int tvId}) async {
    final result = await tvDetailsRepo.getTvRecommendations(tvId: tvId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          tvRecommendedState: RequestStatus.error,
          tvRecommendedErrorMessage: failure.errorMessage,
        ),
      ),
      (tvRecommended) => emit(
        state.copyWith(
          tvRecommendedState: RequestStatus.success,
          tvRecommended: tvRecommended,
        ),
      ),
    );
  }

  Future<void> getTvSimilar({required int tvId}) async {
    final result = await tvDetailsRepo.getTvSimilar(tvId: tvId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          tvSimilarState: RequestStatus.error,
          tvSimilarErrorMessage: failure.errorMessage,
        ),
      ),
      (tvSimilar) => emit(
        state.copyWith(
          tvSimilarState: RequestStatus.success,
          tvSimilar: tvSimilar,
        ),
      ),
    );
  }

  Future<void> getTvReviews({required int tvId}) async {
    final result = await tvDetailsRepo.getTvReviews(tvId: tvId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          tvReviewsState: RequestStatus.error,
          tvReviewsErrorMessage: failure.errorMessage,
        ),
      ),
      (tvReviews) => emit(
        state.copyWith(
          tvReviewsState: RequestStatus.success,
          tvReviews: tvReviews,
        ),
      ),
    );
  }

  Future<void> getAllTvDetails({required int tvId}) async {
    emit(
      state.copyWith(
        allTvDetailsState: RequestStatus.loading,
        isConnected: true,
      ),
    );
    await Future.wait([
      getTvDetails(tvId: tvId),
      getTvCast(tvId: tvId),
      getTvRecommendations(tvId: tvId),
      getTvSimilar(tvId: tvId),
      getTvReviews(tvId: tvId),
    ]);
    if (!state.isConnected) {
      emit(
        state.copyWith(
          allTvDetailsState: RequestStatus.error,
          allTvDetailsErrorMessage: state.allTvDetailsErrorMessage,
        ),
      );
    } else {
      emit(state.copyWith(allTvDetailsState: RequestStatus.success));
    }
  }

  Future<String> getTrailer({required int videoId}) async {
    String trailerKey = '';
    final result = await tvDetailsRepo.getTvTrailer(tvId: videoId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          trailerState: RequestStatus.error,
          trailerErrorMessage: failure.errorMessage,
        ),
      ),
      (trailer) {
        trailerKey = trailer;
        emit(
          state.copyWith(trailerState: RequestStatus.success, videoId: trailer),
        );
      },
    );
    return trailerKey;
  }
}
