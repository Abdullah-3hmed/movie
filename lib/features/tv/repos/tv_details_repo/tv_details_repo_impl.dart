import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/error_model.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/core/error/server_exception.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/features/shared/data/cast_model.dart';
import 'package:movie/features/shared/data/review_model.dart';
import 'package:movie/features/tv/data/tv_details_model.dart';
import 'package:movie/features/tv/data/tv_model.dart';
import 'package:movie/features/tv/repos/tv_details_repo/tv_details_repo.dart';

class TvDetailsRepoImpl implements TvDetailsRepo {
  TvDetailsRepoImpl({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<Either<Failure, TvDetailsModel>> getTvDetails({
    required int tvId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.tvDetailsEndpoint(tvId),
      );
      if (response.statusCode == 200) {
        return Right(TvDetailsModel.fromJson(response.data));
      } else {
        throw ServerException(errorModel: ErrorModel.fromJson(response.data));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessages));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CastModel>>> getTvCast({
    required int tvId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.tvCastEndpoint(tvId),
      );
      if (response.statusCode == 200) {
        return Right(
          response.data['cast']
              .map<CastModel>((e) => CastModel.fromJson(e))
              .toList(),
        );
      } else {
        throw ServerException(errorModel: ErrorModel.fromJson(response.data));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessages));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TvModel>>> getTvRecommendations({
    required int tvId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.tvRecommendedEndpoint(tvId),
      );
      if (response.statusCode == 200) {
        return Right(
          response.data['results']
              .map<TvModel>((e) => TvModel.fromJson(e))
              .toList(),
        );
      } else {
        throw ServerException(errorModel: ErrorModel.fromJson(response.data));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessages));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TvModel>>> getTvSimilar({
    required int tvId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.tvSimilarEndpoint(tvId),
      );
      if (response.statusCode == 200) {
        return Right(
          response.data['results']
              .map<TvModel>((e) => TvModel.fromJson(e))
              .toList(),
        );
      } else {
        throw ServerException(errorModel: ErrorModel.fromJson(response.data));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessages));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReviewModel>>> getTvReviews({
    required int tvId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.tvReviewsEndpoint(tvId),
      );
      if (response.statusCode == 200) {
        return Right(
          response.data['results']
              .map<ReviewModel>((e) => ReviewModel.fromJson(e))
              .toList(),
        );
      } else {
        throw ServerException(errorModel: ErrorModel.fromJson(response.data));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessages));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
