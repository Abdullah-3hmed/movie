import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/media_type.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/profile/cubit/profile_state.dart';
import 'package:movie/features/profile/repos/profile_repo.dart';
import 'package:movie/features/tv/data/tv_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(const ProfileState());
  final ProfileRepo profileRepo;

  Future<void> getProfile() async {
    final result = await profileRepo.getProfile();
    result.fold(
      (failure) {
        if (!failure.isConnected) {
          emit(
            state.copyWith(
              profileState: RequestStatus.error,
              profileErrorMessage: failure.errorMessage,
              isConnected: false,
            ),
          );
        }
        emit(
          state.copyWith(
            profileState: RequestStatus.error,
            profileErrorMessage: failure.errorMessage,
          ),
        );
      },
      (profile) {
        emit(
          state.copyWith(
            profileState: RequestStatus.success,
            profileModel: profile,
          ),
        );
      },
    );
  }

  Future<void> getMoviesWatchList() async {
    final result = await profileRepo.getMoviesWatchList(
      accountId: state.profileModel.id,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            profileState: RequestStatus.error,
            moviesWatchlistErrorMessage: failure.errorMessage,
          ),
        );
      },
      (movies) {
        final Set<int> movieIds = movies.map((e) => e.id).toSet();
        emit(
          state.copyWith(
            profileState: RequestStatus.success,
            moviesWatchlist: movies,
            inMoviesWatchlist: movieIds,
          ),
        );
      },
    );
  }

  Future<void> getTvShowsWatchList() async {
    final result = await profileRepo.getTvShowsWatchList(
      accountId: state.profileModel.id,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            profileState: RequestStatus.error,
            tvWatchlistErrorMessage: failure.errorMessage,
          ),
        );
      },
      (tvs) {
        final Set<int> tvIds = tvs.map((e) => e.id).toSet();
        emit(
          state.copyWith(
            profileState: RequestStatus.success,
            tvWatchlist: tvs,
            inTvWatchlist: tvIds,
          ),
        );
      },
    );
  }

  bool _updateLocalWatchlist({
    required MediaType mediaType,
    required int mediaId,
    TvModel? tvModel,
    MoviesModel? moviesModel,
  }) {
    if (mediaType == MediaType.movie) {
      return _updateMoviesWatchListLocally(mediaId, moviesModel);
    } else {
      return _updateTvWatchListLocally(mediaId, tvModel);
    }
  }

  bool _updateTvWatchListLocally(int mediaId, TvModel? tvModel) {
    bool watchList = false;
    final List<TvModel> tvWatchlist = List<TvModel>.from(state.tvWatchlist);
    final Set<int> inWatchlist = Set<int>.from(state.inTvWatchlist);

    if (inWatchlist.contains(mediaId)) {
      tvWatchlist.removeWhere((tv) => tv.id == mediaId);
      inWatchlist.remove(mediaId);
    } else {
      tvWatchlist.add(tvModel!);
      inWatchlist.add(mediaId);
      watchList = true;
    }
    emit(state.copyWith(tvWatchlist: tvWatchlist, inTvWatchlist: inWatchlist));
    return watchList;
  }

  bool _updateMoviesWatchListLocally(int mediaId, MoviesModel? moviesModel) {
    bool watchList = false;
    final List<MoviesModel> moviesWatchlist = List<MoviesModel>.from(
      state.moviesWatchlist,
    );
    final Set<int> inWatchlist = Set<int>.from(state.inMoviesWatchlist);

    if (inWatchlist.contains(mediaId)) {
      moviesWatchlist.removeWhere((movie) => movie.id == mediaId);
      inWatchlist.remove(mediaId);
    } else {
      moviesWatchlist.add(moviesModel!);
      inWatchlist.add(mediaId);
      watchList = true;
    }

    emit(
      state.copyWith(
        moviesWatchlist: moviesWatchlist,
        inMoviesWatchlist: inWatchlist,
      ),
    );
    return watchList;
  }

  Future<void> addAndRemoveFromWatchList({
    required MediaType mediaType,
    required int mediaId,
    TvModel? tvModel,
    MoviesModel? moviesModel,
  }) async {
    final List<MoviesModel> oldMoviesWatchlist = List<MoviesModel>.from(
      state.moviesWatchlist,
    );
    final Set<int> oldInMoviesWatchlist = Set<int>.from(
      state.inMoviesWatchlist,
    );
    final List<TvModel> oldTvWatchlist = List<TvModel>.from(state.tvWatchlist);
    final Set<int> oldInTvWatchlist = Set<int>.from(state.inTvWatchlist);
    bool watchList = _updateLocalWatchlist(
      mediaType: mediaType,
      mediaId: mediaId,
      tvModel: tvModel,
      moviesModel: moviesModel,
    );
    final result = await profileRepo.addAndRemoveFromWatchList(
      accountId: state.profileModel.id,
      mediaType: mediaType,
      mediaId: mediaId,
      watchList: watchList,
    );

    result.fold((failure) {
      emit(
        state.copyWith(
          moviesWatchlist: oldMoviesWatchlist,
          inMoviesWatchlist: oldInMoviesWatchlist,
          tvWatchlist: oldTvWatchlist,
          inTvWatchlist: oldInTvWatchlist,
          addAndRemoveWatchlistState: RequestStatus.error,
          addAndRemoveWatchlistErrorMessage: failure.errorMessage,
        ),
      );
    }, (_) {});
  }

  Future<void> getProfileAndWatchLists() async {
    emit(
      state.copyWith(
        profileAndWatchlistState: RequestStatus.loading,
        isConnected: true,
      ),
    );
    await getProfile();
    await getMoviesWatchList();
    await getTvShowsWatchList();
    if (!state.isConnected) {
      emit(
        state.copyWith(
          profileAndWatchlistState: RequestStatus.error,
          profileAndWatchlistErrorMessage: state.profileErrorMessage,
        ),
      );
    } else {
      emit(state.copyWith(profileAndWatchlistState: RequestStatus.success));
    }
  }
}
