import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/error_model.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/core/error/server_exception.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/features/tv/data/on_the_air_tv_model.dart';
import 'package:movie/features/tv/data/tv_model.dart';
import 'package:movie/features/tv/repos/tv_repo/tv_repo.dart';

class TvRepoImpl implements TvRepo {
  TvRepoImpl({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<Either<Failure, List<OnTheAirTvModel>>> getOnTheAirShows() async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.tvOnTheAirEndpoint,
      );
      if (response.statusCode == 200) {
        final movies =
            (response.data['results'] as List)
                .map((e) => OnTheAirTvModel.fromJson(e))
                .toList();
        return Right(movies);
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
  Future<Either<Failure, List<TvModel>>> getAiringTodayShows() async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.tvAiringTodayEndpoint,
      );
      if (response.statusCode == 200) {
        final movies =
            (response.data['results'] as List)
                .map((e) => TvModel.fromJson(e))
                .toList();
        return Right(movies);
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
  Future<Either<Failure, List<TvModel>>> getPopularTvShows() async {
    try {
      final response = await dioHelper.get(url: ApiConstants.tvPopularEndpoint);
      if (response.statusCode == 200) {
        final movies =
            (response.data['results'] as List)
                .map((e) => TvModel.fromJson(e))
                .toList();
        return Right(movies);
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
  Future<Either<Failure, List<TvModel>>> getTopRatedTvShows() async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.tvTopRatedEndpoint,
      );
      if (response.statusCode == 200) {
        final movies =
            (response.data['results'] as List)
                .map((e) => TvModel.fromJson(e))
                .toList();
        return Right(movies);
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
