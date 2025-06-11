import 'package:equatable/equatable.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/shared/data/cast_model.dart';
import 'package:movie/features/shared/data/review_model.dart';
import 'package:movie/features/tv/data/tv_details_model.dart';
import 'package:movie/features/tv/data/tv_model.dart';

class TvDetailsState extends Equatable {
  final RequestStatus tvDetailsState;
  final TvDetailsModel tvDetailsModel;
  final String tvDetailsErrorMessage;
  final RequestStatus tvCastState;
  final List<CastModel> tvCast;
  final String tvCastErrorMessage;
  final RequestStatus tvRecommendedState;
  final List<TvModel> tvRecommended;
  final String tvRecommendedErrorMessage;
  final RequestStatus tvSimilarState;
  final List<TvModel> tvSimilar;
  final String tvSimilarErrorMessage;
  final RequestStatus tvReviewsState;
  final List<ReviewModel> tvReviews;
  final String tvReviewsErrorMessage;
  final RequestStatus allTvDetailsState;
  final String allTvDetailsErrorMessage;
  final RequestStatus trailerState;
  final String videoId;
  final String trailerErrorMessage;
  final TvModel tvModel;
  final bool isConnected;

  const TvDetailsState({
    this.tvDetailsState = RequestStatus.loading,
    this.tvDetailsErrorMessage = "",
    this.tvDetailsModel = TvDetailsModel.empty,
    this.tvCastState = RequestStatus.loading,
    this.tvCast = const [],
    this.tvCastErrorMessage = "",
    this.tvRecommendedState = RequestStatus.loading,
    this.tvRecommended = const [],
    this.tvRecommendedErrorMessage = "",
    this.tvSimilarState = RequestStatus.loading,
    this.tvSimilar = const [],
    this.tvSimilarErrorMessage = "",
    this.tvReviewsState = RequestStatus.loading,
    this.tvReviews = const [],
    this.tvReviewsErrorMessage = "",
    this.allTvDetailsState = RequestStatus.initial,
    this.allTvDetailsErrorMessage = "",
    this.trailerState = RequestStatus.initial,
    this.videoId = "",
    this.trailerErrorMessage = "",
    this.tvModel = TvModel.empty,
    this.isConnected = true,
  });

  TvDetailsState copyWith({
    RequestStatus? tvDetailsState,
    TvDetailsModel? tvDetailsModel,
    String? tvDetailsErrorMessage,
    RequestStatus? tvCastState,
    List<CastModel>? tvCast,
    String? tvCastErrorMessage,
    RequestStatus? tvRecommendedState,
    List<TvModel>? tvRecommended,
    String? tvRecommendedErrorMessage,
    RequestStatus? tvSimilarState,
    List<TvModel>? tvSimilar,
    String? tvSimilarErrorMessage,
    RequestStatus? tvReviewsState,
    List<ReviewModel>? tvReviews,
    String? tvReviewsErrorMessage,
    RequestStatus? allTvDetailsState,
    String? allTvDetailsErrorMessage,

    RequestStatus? trailerState,
    String? videoId,
    String? trailerErrorMessage,
    TvModel? tvModel,
    bool? isConnected,
  }) {
    return TvDetailsState(
      tvDetailsState: tvDetailsState ?? this.tvDetailsState,
      tvDetailsModel: tvDetailsModel ?? this.tvDetailsModel,
      tvDetailsErrorMessage:
          tvDetailsErrorMessage ?? this.tvDetailsErrorMessage,
      tvCastState: tvCastState ?? this.tvCastState,
      tvCast: tvCast ?? this.tvCast,
      tvCastErrorMessage: tvCastErrorMessage ?? this.tvCastErrorMessage,
      tvRecommendedState: tvRecommendedState ?? this.tvRecommendedState,
      tvRecommended: tvRecommended ?? this.tvRecommended,
      tvRecommendedErrorMessage:
          tvRecommendedErrorMessage ?? this.tvRecommendedErrorMessage,
      tvSimilarState: tvSimilarState ?? this.tvSimilarState,
      tvSimilar: tvSimilar ?? this.tvSimilar,
      tvSimilarErrorMessage:
          tvSimilarErrorMessage ?? this.tvSimilarErrorMessage,
      tvReviewsState: tvReviewsState ?? this.tvReviewsState,
      tvReviews: tvReviews ?? this.tvReviews,
      tvReviewsErrorMessage:
          tvReviewsErrorMessage ?? this.tvReviewsErrorMessage,
      allTvDetailsState: allTvDetailsState ?? this.allTvDetailsState,
      allTvDetailsErrorMessage:
          allTvDetailsErrorMessage ?? this.allTvDetailsErrorMessage,
      trailerState: trailerState ?? this.trailerState,
      videoId: videoId ?? this.videoId,
      trailerErrorMessage: trailerErrorMessage ?? this.trailerErrorMessage,
      tvModel: tvModel ?? this.tvModel,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object> get props => [
    tvDetailsState,
    tvDetailsModel,
    tvDetailsErrorMessage,
    tvCastState,
    tvCast,
    tvCastErrorMessage,
    tvRecommendedState,
    tvRecommended,
    tvRecommendedErrorMessage,
    tvSimilarState,
    tvSimilar,
    tvSimilarErrorMessage,
    tvReviewsState,
    tvReviews,
    tvReviewsErrorMessage,
    allTvDetailsState,
    allTvDetailsErrorMessage,
    trailerState,
    videoId,
    trailerErrorMessage,
    tvModel,
    isConnected,
  ];
}
