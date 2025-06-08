import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/features/tv/data/on_the_air_tv_model.dart';
import 'package:movie/features/tv/data/tv_model.dart';

abstract class TvRepo {
  Future<Either<Failure, List<OnTheAirTvModel>>> getOnTheAirShows();
  Future<Either<Failure, List<TvModel>>> getAiringTodayShows();
  Future<Either<Failure, List<TvModel>>> getPopularTvShows();
  Future<Either<Failure, List<TvModel>>> getTopRatedTvShows();
}
