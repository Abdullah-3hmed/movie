import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/enums/media_type.dart';
import 'package:movie/core/error/error_model.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/core/error/server_exception.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/profile/data/profile_model.dart';
import 'package:movie/features/profile/repos/profile_repo.dart';
import 'package:movie/features/tv/data/tv_model.dart';

class ProfileRepoImpl implements ProfileRepo {
  ProfileRepoImpl({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.accountIdEndpoint,
        queryParameters: {"session_id": AppConstants.sessionId},
      );
      if (response.statusCode == 200) {
        return Right(ProfileModel.fromJson(response.data));
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
  Future<Either<Failure, List<MoviesModel>>> getMoviesWatchList({
    required int accountId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.watchListMoviesEndpoint(accountId),
        queryParameters: {"session_id": AppConstants.sessionId},
      );
      if (response.statusCode == 200) {
        return Right(
          response.data['results']
              .map<MoviesModel>((e) => MoviesModel.fromJson(e))
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
  Future<Either<Failure, List<TvModel>>> getTvShowsWatchList({
    required int accountId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.watchListTvEndpoint(accountId),
        queryParameters: {"session_id": AppConstants.sessionId},
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
  Future<Either<Failure, void>> addAndRemoveFromWatchList({
    required int accountId,
    required MediaType mediaType,
    required int mediaId,
    required bool watchList,
  }) async {
    try {
      final response = await dioHelper.post(
        url: ApiConstants.watchListEndpoint(accountId),
        queryParameters: {AppConstants.sessionIdKey: AppConstants.sessionId},
        data: {
          "media_type": mediaType.toApiString,
          "media_id": mediaId,
          "watchlist": watchList,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(null);
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
