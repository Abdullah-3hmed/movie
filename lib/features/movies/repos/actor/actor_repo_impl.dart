import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/error_model.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/core/error/server_exception.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/movies/repos/actor/actor_repo.dart';
import 'package:movie/features/shared/data/actor_model.dart';

class ActorRepoImpl implements ActorRepo {
  ActorRepoImpl({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<Either<Failure, ActorModel>> getActorDetails({
    required int actorId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.actorDetailsEndpoint(actorId),
      );
      if (response.statusCode == 200) {
        return Right(ActorModel.fromJson(response.data));
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
  Future<Either<Failure, List<MoviesModel>>> getActorMovies({
    required int actorId,
  }) async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.actorMoviesEndpoint(actorId),
      );
      if (response.statusCode == 200) {
        return Right(
          response.data['cast']
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
