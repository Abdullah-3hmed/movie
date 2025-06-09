import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/search/data/search_actor_model.dart';
import 'package:movie/features/tv/data/tv_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MoviesModel>>> searchMovies({
    required String movieName,
  });
  Future<Either<Failure, List<TvModel>>> searchTvShows({
    required String tvShowName,
  });
  Future<Either<Failure, List<SearchActorModel>>> searchActors({
    required String actorName,
  });
}
