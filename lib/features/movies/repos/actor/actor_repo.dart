import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/shared/data/actor_model.dart';

abstract class ActorRepo {
  Future<Either<Failure, ActorModel>> getActorDetails({required int actorId});
  Future<Either<Failure, List<MoviesModel>>> getActorMovies({
    required int actorId,
  });
}
