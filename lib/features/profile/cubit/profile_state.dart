import 'package:equatable/equatable.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/profile/data/profile_model.dart';
import 'package:movie/features/tv/data/tv_model.dart';

class ProfileState extends Equatable {
  final RequestStatus profileState;
  final String profileErrorMessage;
  final ProfileModel profileModel;
  final RequestStatus moviesWatchlistState;
  final String moviesWatchlistErrorMessage;
  final List<MoviesModel> moviesWatchlist;
  final RequestStatus tvWatchlistState;
  final String tvWatchlistErrorMessage;
  final List<TvModel> tvWatchlist;
  final RequestStatus profileAndWatchlistState;
  final String profileAndWatchlistErrorMessage;
  final RequestStatus addAndRemoveWatchlistState;
  final String addAndRemoveWatchlistErrorMessage;
  final Set<int> inMoviesWatchlist;
  final Set<int> inTvWatchlist;
  final bool isConnected;

  const ProfileState({
    this.profileState = RequestStatus.initial,
    this.profileErrorMessage = '',
    this.profileModel = ProfileModel.empty,
    this.moviesWatchlistState = RequestStatus.initial,
    this.moviesWatchlistErrorMessage = '',
    this.moviesWatchlist = const [],
    this.tvWatchlistState = RequestStatus.initial,
    this.tvWatchlistErrorMessage = '',
    this.tvWatchlist = const [],
    this.profileAndWatchlistState = RequestStatus.initial,
    this.profileAndWatchlistErrorMessage = '',
    this.addAndRemoveWatchlistState = RequestStatus.initial,
    this.addAndRemoveWatchlistErrorMessage = '',
    this.inMoviesWatchlist = const {},
    this.inTvWatchlist = const {},
    this.isConnected = true,
  });

  ProfileState copyWith({
    RequestStatus? profileState,
    String? profileErrorMessage,
    ProfileModel? profileModel,
    RequestStatus? moviesWatchlistState,
    String? moviesWatchlistErrorMessage,
    List<MoviesModel>? moviesWatchlist,
    RequestStatus? tvWatchlistState,
    String? tvWatchlistErrorMessage,
    List<TvModel>? tvWatchlist,
    RequestStatus? profileAndWatchlistState,
    String? profileAndWatchlistErrorMessage,
    RequestStatus? addAndRemoveWatchlistState,
    String? addAndRemoveWatchlistErrorMessage,
    Set<int>? inMoviesWatchlist,
    Set<int>? inTvWatchlist,
    bool? isConnected,
  }) {
    return ProfileState(
      profileState: profileState ?? this.profileState,
      profileErrorMessage: profileErrorMessage ?? this.profileErrorMessage,
      profileModel: profileModel ?? this.profileModel,
      moviesWatchlistState: moviesWatchlistState ?? this.moviesWatchlistState,
      moviesWatchlistErrorMessage:
          moviesWatchlistErrorMessage ?? this.moviesWatchlistErrorMessage,
      moviesWatchlist: moviesWatchlist ?? this.moviesWatchlist,
      tvWatchlistState: tvWatchlistState ?? this.tvWatchlistState,
      tvWatchlistErrorMessage:
          tvWatchlistErrorMessage ?? this.tvWatchlistErrorMessage,
      tvWatchlist: tvWatchlist ?? this.tvWatchlist,
      isConnected: isConnected ?? this.isConnected,
      profileAndWatchlistState:
          profileAndWatchlistState ?? this.profileAndWatchlistState,
      profileAndWatchlistErrorMessage:
          profileAndWatchlistErrorMessage ??
          this.profileAndWatchlistErrorMessage,
      addAndRemoveWatchlistState:
          addAndRemoveWatchlistState ?? this.addAndRemoveWatchlistState,
      addAndRemoveWatchlistErrorMessage:
          addAndRemoveWatchlistErrorMessage ??
          this.addAndRemoveWatchlistErrorMessage,
      inMoviesWatchlist: inMoviesWatchlist ?? this.inMoviesWatchlist,
      inTvWatchlist: inTvWatchlist ?? this.inTvWatchlist,
    );
  }

  @override
  List<Object> get props => [
    profileState,
    profileErrorMessage,
    profileModel,
    moviesWatchlistState,
    moviesWatchlistErrorMessage,
    moviesWatchlist,
    tvWatchlistState,
    tvWatchlistErrorMessage,
    tvWatchlist,
    profileAndWatchlistState,
    profileAndWatchlistErrorMessage,
    addAndRemoveWatchlistState,
    addAndRemoveWatchlistErrorMessage,
    inMoviesWatchlist,
    inTvWatchlist,
    isConnected,
  ];
}
