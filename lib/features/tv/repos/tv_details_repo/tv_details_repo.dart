import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/features/shared/data/cast_model.dart';
import 'package:movie/features/shared/data/review_model.dart';
import 'package:movie/features/tv/data/tv_details_model.dart';
import 'package:movie/features/tv/data/tv_model.dart';

abstract class TvDetailsRepo {
  Future<Either<Failure, TvDetailsModel>> getTvDetails({required int tvId});

  Future<Either<Failure, List<CastModel>>> getTvCast({required int tvId});

  Future<Either<Failure, List<TvModel>>> getTvRecommendations({
    required int tvId,
  });

  Future<Either<Failure, List<TvModel>>> getTvSimilar({required int tvId});

  Future<Either<Failure, List<ReviewModel>>> getTvReviews({required int tvId});
  Future<Either<Failure, String>> getTvTrailer({required int tvId});
}
