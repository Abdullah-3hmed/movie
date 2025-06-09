import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/error_model.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/core/error/server_exception.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/search/data/search_actor_model.dart';
import 'package:movie/features/search/repos/search_repo.dart';
import 'package:movie/features/tv/data/tv_model.dart';

class SearchRepoImpl implements SearchRepo {
  SearchRepoImpl({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<Either<Failure, List<MoviesModel>>> searchMovies({
    required String movieName,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.searchMovieEndpoint,
        queryParameters: {"query": movieName},
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
  Future<Either<Failure, List<TvModel>>> searchTvShows({
    required String tvShowName,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.searchTvEndpoint,
        queryParameters: {"query": tvShowName},
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
  Future<Either<Failure, List<SearchActorModel>>> searchActors({
    required String actorName,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.searchPersonEndpoint,
        queryParameters: {"query": actorName},
      );
      if (response.statusCode == 200) {
        return Right(
          response.data['results']
              .map<SearchActorModel>((e) => SearchActorModel.fromJson(e))
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
