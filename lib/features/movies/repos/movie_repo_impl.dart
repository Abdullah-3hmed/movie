import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/error_model.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/core/error/server_exception.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/features/movies/data/movie/now_playing_model.dart';
import 'package:movie/features/movies/repos/movie_repo.dart';

class MovieRepoImpl implements MovieRepo {
  MovieRepoImpl({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<Either<Failure, List<MovieNowPlayingModel>>>
  getNowPlayingMovies() async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.nowPlayingMoviesEndpoint,
      );
      if (response.statusCode == 200) {
        return Right(
          response.data['results']
              .map<MovieNowPlayingModel>(
                (e) => MovieNowPlayingModel.fromJson(e),
              )
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
