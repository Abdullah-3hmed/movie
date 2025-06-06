import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/error_model.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/core/error/server_exception.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/features/movies/data/movie_details/movie_details_model.dart';
import 'package:movie/features/movies/repos/movie_details_repo.dart';

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
}
