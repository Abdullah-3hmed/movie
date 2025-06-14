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
            moviesWatchlistState: RequestStatus.error,
            moviesWatchlistErrorMessage: failure.errorMessage,
          ),
        );
      },
      (movies) {
        final Set<int> movieIds = movies.map((e) => e.id).toSet();
        emit(
          state.copyWith(
            moviesWatchlistState: RequestStatus.success,
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
            tvWatchlistState: RequestStatus.error,
            tvWatchlistErrorMessage: failure.errorMessage,
          ),
        );
      },
      (tvs) {
        final Set<int> tvIds = tvs.map((e) => e.id).toSet();
        emit(
          state.copyWith(
            tvWatchlistState: RequestStatus.success,
            tvWatchlist: tvs,
            inTvWatchlist: tvIds,
          ),
        );
      },
    );
  }

  Future<void> addAndRemoveFromTvWatchList({
    required int tvId,
     TvModel? tvModel,
  }) async {
    final List<TvModel> oldTvWatchlist = List<TvModel>.from(state.tvWatchlist);
    final Set<int> oldInTvWatchlist = Set<int>.from(state.inTvWatchlist);
    bool watchList = false;
    final List<TvModel> tvWatchlist = List<TvModel>.from(state.tvWatchlist);
    final Set<int> inWatchlist = Set<int>.from(state.inTvWatchlist);

    if (inWatchlist.contains(tvId)) {
      tvWatchlist.removeWhere((tv) => tv.id == tvId);
      inWatchlist.remove(tvId);
    } else {
      tvWatchlist.add(tvModel!);
      inWatchlist.add(tvId);
      watchList = true;
    }
    emit(state.copyWith(tvWatchlist: tvWatchlist, inTvWatchlist: inWatchlist));
    final result = await profileRepo.addAndRemoveFromWatchList(
      accountId: state.profileModel.id,
      mediaType: MediaType.tv,
      mediaId: tvId,
      watchList: watchList,
    );

    result.fold((failure) {
      emit(
        state.copyWith(
          tvWatchlist: oldTvWatchlist,
          inTvWatchlist: oldInTvWatchlist,
          addAndRemoveWatchlistState: RequestStatus.error,
          addAndRemoveWatchlistErrorMessage: failure.errorMessage,
        ),
      );
    }, (_) {});
  }

  Future<void> addAndRemoveFromMoviesWatchList({
    required int movieId,
     MoviesModel? movieModel,
  }) async {
    final List<MoviesModel> oldMoviesWatchlist = List<MoviesModel>.from(
      state.moviesWatchlist,
    );
    final Set<int> oldInMoviesWatchlist = Set<int>.from(
      state.inMoviesWatchlist,
    );
    bool watchList = false;
    final List<MoviesModel> moviesWatchlist = List<MoviesModel>.from(
      state.moviesWatchlist,
    );
    final Set<int> inWatchlist = Set<int>.from(state.inMoviesWatchlist);

    if (inWatchlist.contains(movieId)) {
      moviesWatchlist.removeWhere((movie) => movie.id == movieId);
      inWatchlist.remove(movieId);
    } else {
      moviesWatchlist.add(movieModel!);
      inWatchlist.add(movieId);
      watchList = true;
    }

    emit(
      state.copyWith(
        moviesWatchlist: moviesWatchlist,
        inMoviesWatchlist: inWatchlist,
      ),
    );
    final result = await profileRepo.addAndRemoveFromWatchList(
      accountId: state.profileModel.id,
      mediaType: MediaType.movie,
      mediaId: movieId,
      watchList: watchList,
    );

    result.fold((failure) {
      emit(
        state.copyWith(
          moviesWatchlist: oldMoviesWatchlist,
          inMoviesWatchlist: oldInMoviesWatchlist,
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
