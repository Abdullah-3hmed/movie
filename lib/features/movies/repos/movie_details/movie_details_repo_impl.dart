import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/error_model.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/core/error/server_exception.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/features/movies/data/movie/movies_model.dart';
import 'package:movie/features/movies/data/movie_details/movie_details_model.dart';
import 'package:movie/features/movies/repos/movie_details/movie_details_repo.dart';
import 'package:movie/features/shared/data/cast_model.dart';
import 'package:movie/features/shared/data/review_model.dart';

class MovieDetailsRepoImpl implements MovieDetailsRepo {
  MovieDetailsRepoImpl({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails({
    required int movieId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.movieDetailsEndpoint(movieId),
      );
      if (response.statusCode == 200) {
        return Right(MovieDetailsModel.fromJson(response.data));
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
  Future<Either<Failure, List<CastModel>>> getMovieCast({
    required int movieId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.movieCastEndpoint(movieId),
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
  Future<Either<Failure, List<MoviesModel>>> getRecommendedMovies({
    required int movieId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.movieRecommendedEndpoint(movieId),
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
  Future<Either<Failure, List<MoviesModel>>> getSimilarMovies({
    required int movieId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.movieSimilarEndpoint(movieId),
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
  Future<Either<Failure, List<ReviewModel>>> getMovieReviews({
    required int movieId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.movieReviewsEndpoint(movieId),
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

  @override
  Future<Either<Failure, String>> getMovieTrailer({
    required int movieId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.movieVideosEndpoint(movieId),
      );
      if (response.statusCode == 200) {
        final videos = response.data['results'] as List;
        final trailer = videos.firstWhere(
          (video) =>
              video['site'] == 'YouTube' &&
              video['type'] == 'Trailer' &&
              video['official'] == true,
          orElse: () => null,
        );
        final fallback = videos.firstWhere(
          (video) => video['site'] == 'YouTube',
          orElse: () => null,
        );
        final videoKey = trailer?['key'] ?? fallback?['key'];
        if (videoKey != null) {
          return Right(videoKey);
        } else {
          return const Left(ServerFailure('No YouTube trailer found.'));
        }
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
