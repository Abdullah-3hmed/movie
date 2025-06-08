import 'package:equatable/equatable.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/tv/data/on_the_air_tv_model.dart';
import 'package:movie/features/tv/data/tv_model.dart';

class TvState extends Equatable {
  final RequestStatus tvAiringTodayState;
  final String tvAiringTodayErrorMessage;
  final List<TvModel> tvAiringTodayShows;
  final RequestStatus tvPopularState;
  final String tvPopularErrorMessage;
  final List<TvModel> tvPopularShows;
  final RequestStatus tvTopRatedState;
  final String tvTopRatedErrorMessage;
  final List<TvModel> tvTopRatedShows;
  final RequestStatus tvOnTheAirState;
  final String tvOnTheAirErrorMessage;
  final List<OnTheAirTvModel> tvOnTheAirShows;
  final RequestStatus allTvState;
  final String allTvErrorMessage;
  final bool isConnected;

  const TvState({
    this.tvAiringTodayState = RequestStatus.loading,
    this.tvAiringTodayErrorMessage = "",
    this.tvAiringTodayShows = const [],
    this.tvPopularState = RequestStatus.loading,
    this.tvPopularErrorMessage = "",
    this.tvPopularShows = const [],
    this.tvTopRatedState = RequestStatus.loading,
    this.tvTopRatedErrorMessage = "",
    this.tvTopRatedShows = const [],
    this.tvOnTheAirState = RequestStatus.loading,
    this.tvOnTheAirErrorMessage = "",
    this.tvOnTheAirShows = const [],
    this.allTvState = RequestStatus.initial,
    this.allTvErrorMessage = "",
    this.isConnected = true,
  });

  TvState copyWith({
    RequestStatus? tvAiringTodayState,
    String? tvAiringTodayErrorMessage,
    List<TvModel>? tvAiringTodayShows,
    RequestStatus? tvPopularState,
    String? tvPopularErrorMessage,
    List<TvModel>? tvPopularShows,
    RequestStatus? tvTopRatedState,
    String? tvTopRatedErrorMessage,
    List<TvModel>? tvTopRatedShows,
    RequestStatus? tvOnTheAirState,
    String? tvOnTheAirErrorMessage,
    List<OnTheAirTvModel>? tvOnTheAirShows,
    RequestStatus? allTvState,
    String? allTvErrorMessage,
    bool? isConnected,
  }) {
    return TvState(
      tvAiringTodayState: tvAiringTodayState ?? this.tvAiringTodayState,
      tvAiringTodayErrorMessage:
          tvAiringTodayErrorMessage ?? this.tvAiringTodayErrorMessage,
      tvAiringTodayShows: tvAiringTodayShows ?? this.tvAiringTodayShows,
      tvPopularState: tvPopularState ?? this.tvPopularState,
      tvPopularErrorMessage:
          tvPopularErrorMessage ?? this.tvPopularErrorMessage,
      tvPopularShows: tvPopularShows ?? this.tvPopularShows,
      tvTopRatedState: tvTopRatedState ?? this.tvTopRatedState,
      tvTopRatedErrorMessage:
          tvTopRatedErrorMessage ?? this.tvTopRatedErrorMessage,
      tvTopRatedShows: tvTopRatedShows ?? this.tvTopRatedShows,
      tvOnTheAirState: tvOnTheAirState ?? this.tvOnTheAirState,
      tvOnTheAirErrorMessage:
          tvOnTheAirErrorMessage ?? this.tvOnTheAirErrorMessage,
      tvOnTheAirShows: tvOnTheAirShows ?? this.tvOnTheAirShows,
      allTvState: allTvState ?? this.allTvState,
      allTvErrorMessage: allTvErrorMessage ?? this.allTvErrorMessage,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object> get props => [
    tvAiringTodayState,
    tvAiringTodayErrorMessage,
    tvAiringTodayShows,
    tvPopularState,
    tvPopularErrorMessage,
    tvPopularShows,
    tvTopRatedState,
    tvTopRatedErrorMessage,
    tvTopRatedShows,
    tvOnTheAirState,
    tvOnTheAirErrorMessage,
    tvOnTheAirShows,
    allTvState,
    allTvErrorMessage,
    isConnected,
  ];
}
