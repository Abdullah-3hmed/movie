import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/error_model.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/core/error/server_exception.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/movies/data/up_coming_movies_model.dart';
import 'package:movie/features/movies/repos/movie/movie_repo.dart';

class MovieRepoImpl implements MovieRepo {
  MovieRepoImpl({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<Either<Failure, List<UpComingMoviesModel>>> getUpComingMovies() async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.upComingMoviesEndpoint,
      );
      if (response.statusCode == 200) {
        return Right(
          response.data['results']
              .map<UpComingMoviesModel>((e) => UpComingMoviesModel.fromJson(e))
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
  Future<Either<Failure, List<MoviesModel>>> getNowPlayingMovies({
    required int page,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.nowPlayingMoviesEndpoint,
        queryParameters: {"page": page},
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
  Future<Either<Failure, List<MoviesModel>>> getTopRatedMovies({
    required int page,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.topRatedMoviesEndpoint,
        queryParameters: {"page": page},
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
  Future<Either<Failure, List<MoviesModel>>> getPopularMovies({
    required int page,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.popularMoviesEndpoint,
        queryParameters: {"page": page},
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
}
