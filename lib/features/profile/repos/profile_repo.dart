import 'package:dartz/dartz.dart';
import 'package:movie/core/enums/media_type.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/profile/data/profile_model.dart';
import 'package:movie/features/tv/data/tv_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, List<MoviesModel>>> getMoviesWatchList({
    required int accountId,
  });
  Future<Either<Failure, List<TvModel>>> getTvShowsWatchList({
    required int accountId,
  });
  Future<Either<Failure, void>> addAndRemoveFromWatchList({
    required int accountId,
    required MediaType mediaType,
    required int mediaId,
    required bool watchList,
  });
}
